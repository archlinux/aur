# Maintainer: HanHaocheng <1849397656@qq.com>
#
# Source package for XDM 9.0.8, built from the upstream tag tarball.
#
# Why this is a source package and not another -bin:
#   xdm-app-bin only repackages the release tarball that GitHub publishes. This
#   package compiles the 9.0.8 tag (commit 2f46454fe513edaaa943d097c93673746919b0fb)
#   with Maven and then runs upstream's own packaging/build-bundle.sh to
#   jlink/jpackage the app image, so the result follows the upstream sources and
#   can be rebuilt or patched locally at any time - no prebuilt app blob, and no
#   dependence on the release assets staying online.
#
# Why a prebuilt JetBrains Runtime has to be downloaded as a source:
#   1. The app image is linked with jlink from a *pinned* JDK. build-bundle.sh
#      hard-refuses any java on PATH that is not the JetBrains Runtime build
#      named in packaging/jdk.properties (jbr.version=25.0.4.1,
#      jbr.build=b635.70). --any-jdk exists for local experiments and must not
#      be used for a package: the AppCDS class lists under packaging/cds are
#      recorded on that exact build and only hold for it.
#   2. The vendor alone already rules out Arch's jdk-openjdk/jdk25-openjdk:
#      XDM's Linux UI needs JBR's java.desktop, whose native Wayland toolkit is
#      a JetBrains patch that upstream OpenJDK does not carry.
#   3. That JBR build is not in the Arch repositories, so it is fetched from
#      JetBrains' cache-redirector (the same host upstream's Linux Docker build
#      uses) and verified against the SHA-512 JetBrains publishes for it, then
#      used as the build JDK (JAVA_HOME/PATH) and as the Maven JDK 25 toolchain.
#   The JBR is a build-time tool only: at runtime the package uses the jlink'd
#   runtime inside /opt/xdm-app/lib/runtime, so the JBR is not a dependency.
#
# The tag tarball is a generated archive; if GitHub ever regenerates it the
# sha256 below changes and the build stops at the checksum, as intended.
#
# Dependency, description and desktop metadata match the published xdm-app-bin.

pkgname=xdm-app
pkgver=9.0.8
pkgrel=1
pkgdesc='Fast, resumable download accelerator and video downloader with HLS/DASH support'
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
makedepends=('maven' 'zip' 'unzip' 'binutils')
conflicts=('xdm-app-bin' 'xdman' 'xdman_gtk')
replaces=('xdman' 'xdman_gtk')
options=('!strip' '!debug')

# Common source: the 9.0.8 tag. Renamed because the archive's own file name
# would be 9.0.8.tar.gz; it unpacks to $srcdir/xdm-9.0.8.
source=("xdm-$pkgver.tar.gz::https://github.com/subhra74/xdm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('236967d717238616c6c252760b48ff382d1c6f5b83d4cffca5f992260e1f7d3a')

# The pinned build JDK (packaging/jdk.properties: jbr.version=25.0.4.1,
# jbr.build=b635.70). Checksums are the SHA-512s JetBrains publishes next to
# each archive at <url>.checksum, and are the ones upstream's Docker build
# verifies. Note makepkg matches <integ>sums_<arch> against source_<arch> only,
# so the common tarball keeps sha256sums and the JBR uses sha512sums_<arch>.
_jbr_ver=25.0.4.1
_jbr_build=b635.70
_jbr_base=https://cache-redirector.jetbrains.com/intellij-jbr
# makepkg unpacks every source archive itself (the PKGBUILD-level "noextract"
# option is gone in pacman 7), and this one has a single top-level directory
# whose name is the archive name minus ".tar.gz" - which is exactly a JDK home.
# build() therefore uses that directory as JAVA_HOME instead of re-extracting.
source_x86_64=("$_jbr_base/jbrsdk-$_jbr_ver-linux-x64-$_jbr_build.tar.gz")
sha512sums_x86_64=('15b9e9788a1d658851a1bf32fc998fc6660f5f8084e4c303b42fd0f13cc2b2b77b72fab1b86476b066cadaa95f6a7186a058e5487128eb259a875e9c6d456f56')
source_aarch64=("$_jbr_base/jbrsdk-$_jbr_ver-linux-aarch64-$_jbr_build.tar.gz")
sha512sums_aarch64=('22771d9d166bd0f9d477c0100fc10bb32b11bc5c942953cf949f7e24d548f42e50e7c6f1c426eed590ca5326acb75e899c4b9f06ba13128aeb2876ca5d96a5f6')

build() {
  cd "$srcdir"

  # ---- build JDK: the JBR tree makepkg already unpacked -------------------
  # Only one of the two JBR archives is fetched per architecture, so a single
  # match is expected; the glob keeps this architecture-neutral ($srcdir is
  # cleared between builds, so a stale second copy cannot be picked up).
  local jbr_home jbr_jdk_version jbr_runtime_version release_file
  jbr_home=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d \
                  -name "jbrsdk-$_jbr_ver-linux-*-$_jbr_build" | head -n1)
  if [[ -z $jbr_home ]]; then
    echo "no jbrsdk-$_jbr_ver-linux-*-$_jbr_build directory in $srcdir" >&2
    return 1
  fi
  # Make sure what makepkg unpacked is a real JDK home instead of relying on
  # the archive layout staying the same.
  [[ -x $jbr_home/bin/java ]] ||
    { echo "unexpected JBR layout: $jbr_home/bin/java is missing" >&2; return 1; }

  # JDK release files quote values, but not always; strip the quotes.
  _release_field() { grep -m1 "^$2=" "$1" | cut -d= -f2- | tr -d '"'; }

  # build-bundle.sh reads these two fields out of $JAVA_HOME/release and
  # refuses to build unless JAVA_VERSION == jbr.version and
  # JAVA_RUNTIME_VERSION ends in -jbr.build. Checking here fails early and
  # with a clear message instead of inside jlink.
  release_file=$jbr_home/release
  [[ -f $release_file ]] || { echo "missing $release_file" >&2; return 1; }
  jbr_jdk_version=$(_release_field "$release_file" JAVA_VERSION)
  jbr_runtime_version=$(_release_field "$release_file" JAVA_RUNTIME_VERSION)

  if [[ $jbr_jdk_version != "$_jbr_ver" ]]; then
    echo "JBR JAVA_VERSION is '$jbr_jdk_version', expected '$_jbr_ver'" >&2
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
  # The root pom's maven-toolchains-plugin selects a JDK 25 toolchain, which is
  # independent of whatever JVM Maven itself runs on. The file is generated in
  # $srcdir (never in ~/.m2) and points at the unpacked JBR.
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

  cd "$srcdir/xdm-$pkgver"

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

  # The app image is self-contained: bin/xdm-app, lib/app, lib/runtime.
  cp -a "$srcdir/dist/xdm-app" "$pkgdir/opt/xdm-app"
  ln -s /opt/xdm-app/bin/xdm-app "$pkgdir/usr/bin/xdm-app"

  # The image ships a single (256 px) icon; desktops scale it as needed.
  install -Dm644 "$srcdir/dist/xdm-app/lib/xdm-app.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xdm-app.png"

  # Verbatim copy of packaging/linux/xdm-app.desktop at the 9.0.8 tag.
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
