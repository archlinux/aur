# Maintainer: HanHaocheng <1849397656@qq.com>
#
# VCS package: tracks the upstream master branch (https://github.com/subhra74/xdm)
# and rebuilds the app image from whatever is at HEAD at build time.
#
# This is the counterpart of xdm-app (which pins the release tag) and of
# xdm-app-bin (which repackages the release). Upstream cuts releases every few
# days and keeps developing on master in between; master is currently several
# commits ahead of 9.0.8 - including the CJK font fallback fix
# (93e6d30f, merged as #1379) that no release tag contains yet.
#
# Caveat: upstream says in its README that the code is being restructured and
# that "pull requests made now may need a lot of rework". A commit on master can
# therefore fail to build; this package is for people who want the newest code
# and can wait out a broken commit.
#
# Why a prebuilt JetBrains Runtime has to be downloaded as a source (same
# reasoning as the xdm-app package, repeated here so this file stands alone):
#   1. packaging/build-bundle.sh refuses any java on PATH that is not the build
#      named in packaging/jdk.properties (jbr.version=25.0.4.1,
#      jbr.build=b635.70). --any-jdk exists for local experiments and must not
#      be used for a package: the AppCDS class lists under packaging/cds are
#      recorded on that exact build and only hold for it.
#   2. XDM's Linux UI needs JBR's java.desktop, whose native Wayland toolkit is a
#      JetBrains patch that upstream OpenJDK does not carry.
#   3. That JBR build is not in the Arch repositories, so it is fetched from
#      JetBrains' cache-redirector (the host upstream's Linux Docker build uses)
#      and verified against the SHA-512 JetBrains publishes for it.
#   The JBR is a build-time tool only: at runtime the package uses the jlink'd
#   runtime inside /opt/xdm-app/lib/runtime.
#
# If upstream ever bumps packaging/jdk.properties, the check in build() stops
# with a clear message: update _jbr_ver/_jbr_build and the sha512sums here.

pkgname=xdm-app-git
pkgver=9.0.8.r10.ge5a9ecda
pkgrel=1
pkgdesc='Fast, resumable download accelerator and video downloader with HLS/DASH support (master branch)'
arch=('x86_64' 'aarch64')
url='https://xtremedownloadmanager.com/'
license=('GPL-3.0-only')
depends=('libx11' 'libxext' 'libxrender' 'libxtst' 'libxi' 'freetype2' 'fontconfig' 'ttf-font')
optdepends=(
  'wayland: use the native Wayland toolkit instead of XWayland'
  'libxkbcommon: use the native Wayland toolkit instead of XWayland'
  'gtk3: native GTK file chooser dialogs'
  'alsa-lib: sound notifications'
)
makedepends=('git' 'maven' 'zip' 'unzip' 'binutils')
# The release tag package, its binary counterpart and the Fedora-RPM repack by
# another maintainer all own /opt/xdm-app; only one of them may be installed.
provides=('xdm-app')
conflicts=('xdm-app' 'xdm-app-bin' 'xdman-bin' 'xdman' 'xdman_gtk')
replaces=('xdman' 'xdman_gtk')
options=('!strip' '!debug')

source=("$pkgname::git+https://github.com/subhra74/xdm.git")
sha256sums=('SKIP')

# The pinned build JDK (packaging/jdk.properties). Checksums are the SHA-512s
# JetBrains publishes at <url>.checksum; makepkg matches <integ>sums_<arch>
# against source_<arch> only, hence the per-architecture arrays.
_jbr_ver=25.0.4.1
_jbr_build=b635.70
_jbr_base=https://cache-redirector.jetbrains.com/intellij-jbr
source_x86_64=("$_jbr_base/jbrsdk-$_jbr_ver-linux-x64-$_jbr_build.tar.gz")
sha512sums_x86_64=('15b9e9788a1d658851a1bf32fc998fc6660f5f8084e4c303b42fd0f13cc2b2b77b72fab1b86476b066cadaa95f6a7186a058e5487128eb259a875e9c6d456f56')
source_aarch64=("$_jbr_base/jbrsdk-$_jbr_ver-linux-aarch64-$_jbr_build.tar.gz")
sha512sums_aarch64=('22771d9d166bd0f9d477c0100fc10bb32b11bc5c942953cf949f7e24d548f42e50e7c6f1c426eed590ca5326acb75e899c4b9f06ba13128aeb2876ca5d96a5f6')

# <app version from app-version.json>.r<commit count>.g<short sha>, e.g.
# 9.0.8.r10.ge5a9ecda. The commit count makes it sort monotonically.
pkgver() {
  cd "$pkgname"
  local ver tag rev
  ver=$(sed -n 's/.*"currentVersion"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' \
        xdm-app/src/main/resources/app-version.json | head -n1)
  # commits since the newest tag ("r0" when HEAD is the tag itself)
  tag=$(git describe --tags --abbrev=0 2>/dev/null || true)
  if [[ -n $tag ]]; then
    rev=$(git rev-list --count "$tag"..HEAD)
  else
    rev=$(git rev-list --count HEAD)
  fi
  printf '%s.r%s.g%s' "${ver:-0}" "$rev" "$(git rev-parse --short=8 HEAD)"
}

build() {
  cd "$srcdir"

  # ---- build JDK: the JBR tree makepkg already unpacked -------------------
  local jbr_home jbr_jdk_version jbr_runtime_version release_file
  jbr_home=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d \
                  -name "jbrsdk-$_jbr_ver-linux-*-$_jbr_build" | head -n1)
  if [[ -z $jbr_home ]]; then
    echo "no jbrsdk-$_jbr_ver-linux-*-$_jbr_build directory in $srcdir" >&2
    return 1
  fi
  [[ -x $jbr_home/bin/java ]] ||
    { echo "unexpected JBR layout: $jbr_home/bin/java is missing" >&2; return 1; }

  _release_field() { grep -m1 "^$2=" "$1" | cut -d= -f2- | tr -d '"'; }
  release_file=$jbr_home/release
  [[ -f $release_file ]] || { echo "missing $release_file" >&2; return 1; }
  jbr_jdk_version=$(_release_field "$release_file" JAVA_VERSION)
  jbr_runtime_version=$(_release_field "$release_file" JAVA_RUNTIME_VERSION)

  if [[ $jbr_jdk_version != "$_jbr_ver" ]]; then
    echo "JBR JAVA_VERSION is '$jbr_jdk_version', expected '$_jbr_ver'" >&2
    echo "upstream packaging/jdk.properties may have bumped the pin: update the PKGBUILD" >&2
    return 1
  fi
  if [[ $jbr_runtime_version != *"-$_jbr_build"* ]]; then
    echo "JBR JAVA_RUNTIME_VERSION is '$jbr_runtime_version'," >&2
    echo "expected it to contain '-$_jbr_build'" >&2
    return 1
  fi

  export JAVA_HOME="$jbr_home"
  export PATH="$JAVA_HOME/bin:$PATH"

  # ---- Maven toolchain ---------------------------------------------------
  # The root pom's maven-toolchains-plugin selects a JDK 25 toolchain. The file
  # lives in $srcdir (never in ~/.m2) and points at the unpacked JBR.
  cat > "$srcdir/toolchains.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<toolchains>
  <toolchain>
    <type>jdk</type>
    <provides>
      <version>25</version>
    </provides>
    <configuration>
      <jdkHome>$JAVA_HOME</jdkHome>
    </configuration>
  </toolchain>
</toolchains>
EOF

  cd "$srcdir/$pkgname"

  # ---- fat jar -----------------------------------------------------------
  # Maven runs on the JBR (JAVA_HOME + PATH above). The local repository is kept
  # inside $srcdir so the build never reads or writes the user's ~/.m2.
  mvn -q clean package -DskipTests -t "$srcdir/toolchains.xml" -Dmaven.repo.local="$srcdir/m2repo"

  [[ -f xdm-app/target/xdm-app.jar ]] ||
    { echo "xdm-app/target/xdm-app.jar was not produced" >&2; return 1; }

  # ---- app image ---------------------------------------------------------
  # -s: reuse the jar just built. The pinned JBR is re-stated on the command
  # line because the script validates (and then uses for jlink/jpackage) the
  # java it finds on PATH.
  PATH="$JAVA_HOME/bin:$PATH" JAVA_HOME="$JAVA_HOME" packaging/build-bundle.sh -s -t app-image -o "$srcdir/dist"

  [[ -x "$srcdir/dist/xdm-app/bin/xdm-app" ]] ||
    { echo "app image not produced at $srcdir/dist/xdm-app" >&2; return 1; }
}

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/applications" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  cp -a "$srcdir/dist/xdm-app" "$pkgdir/opt/xdm-app"
  ln -s /opt/xdm-app/bin/xdm-app "$pkgdir/usr/bin/xdm-app"

  install -Dm644 "$srcdir/dist/xdm-app/lib/xdm-app.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/xdm-app.png"

  # Verbatim copy of packaging/linux/xdm-app.desktop from the tracked tree.
  cat > "$pkgdir/usr/share/applications/xdm-app.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Xtreme Download Manager
GenericName=Download Manager
Comment=Download accelerator and video downloader
Exec=/opt/xdm-app/bin/xdm-app %U
Icon=xdm-app
Terminal=false
Categories=Network;FileTransfer;
Keywords=download;accelerator;video;hls;dash;
MimeType=x-scheme-handler/xdm-app;
# No launch feedback: GNOME ends its busy cursor when the first window hands back the launch's
# XDG_ACTIVATION_TOKEN, and JBR's Wayland toolkit never does, so the cursor stayed busy until the
# timeout (PACKAGING.md 7.2).
StartupNotify=false
# X11 window class; under native Wayland the window's app id is xdm-app, which matches this file's name.
StartupWMClass=xdm-app-AppMain
DESKTOP
  chmod 644 "$pkgdir/usr/share/applications/xdm-app.desktop"
}
