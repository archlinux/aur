# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-enhanced
pkgver=0.21.2
pkgrel=1
pkgdesc="Modrinth App without ads or telemetry, with offline and Ely.by accounts and Linux fixes"
arch=('x86_64')
url="https://github.com/Felitendo/Modrinth-Enhanced"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libsoup3' 'webkit2gtk-4.1'
         # loaded by Minecraft, not by the launcher
         'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
# git replays the patches the way upstream's scripts/prepare.sh does; the JDK
# builds the Java agent, whose Gradle toolchain asks for exactly 17
makedepends=('cargo' 'git' 'jdk17-openjdk' 'node-gyp' 'nodejs>=24.15.0' 'npm' 'pnpm')
optdepends=('xorg-xrandr: for older Minecraft versions')
# the release profile carries no debug info, so a -debug package would be empty
options=('!lto' '!debug')
# Modrinth Enhanced holds no forked source, only patches. Its release tag
# records the Modrinth App release it was built on (upstream.txt) and the one
# the patches were exported against (patches/base.txt); pkg.sh reads both.
# A new revision of the patches on the same release is tagged v0.21.2-2, which
# pkgver spells 0.21.2.r2.
_tag="v0.21.2"
_upstream="v0.21.2"
_base="v0.21.2"
source=("${pkgname}-${_tag}.tar.gz::https://github.com/Felitendo/Modrinth-Enhanced/archive/refs/tags/${_tag}.tar.gz"
        "modrinth-code-${_upstream}.tar.gz::https://github.com/modrinth/code/archive/refs/tags/${_upstream}.tar.gz")
noextract=("modrinth-code-${_upstream}.tar.gz")
if [[ "$_base" != "$_upstream" ]]; then
  source+=("modrinth-code-${_base}.tar.gz::https://github.com/modrinth/code/archive/refs/tags/${_base}.tar.gz")
  noextract+=("modrinth-code-${_base}.tar.gz")
fi
sha256sums=('a87ddcef0a39ab4a2c56ece806e381c6b398c755da00a9734b0162abc377e5a6' '583e085cd7ae64a7020656af4ecc64ecfcc82fd97519f74cc3ab114d49574a5e')

prepare() {
  # What upstream's scripts/prepare.sh does with two shallow tags: apply the
  # patches to the release they were exported against, where they always fit,
  # then rebase them onto the release this version was built on, so that a
  # change upstream made near a patch is merged instead of failing to apply.
  export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1
  export GIT_AUTHOR_NAME="Modrinth Enhanced" GIT_AUTHOR_EMAIL="patches@modrinth-enhanced.invalid"
  export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME" GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

  rm -rf app
  mkdir app
  cd app
  git init -q
  # reset --hard checks the tree out again with upstream's .gitattributes
  # applied, as a clone of the tag would have it
  bsdtar -xf "$srcdir/modrinth-code-${_base}.tar.gz" --strip-components 1
  git add -Af
  git commit -qm "Modrinth App ${_base}"
  git reset -q --hard
  git tag base
  if [[ "$_base" != "$_upstream" ]]; then
    git rm -rqf .
    bsdtar -xf "$srcdir/modrinth-code-${_upstream}.tar.gz" --strip-components 1
    git add -Af
    git commit -qm "Modrinth App ${_upstream}"
    git reset -q --hard
    git tag upstream
    git checkout -q -b enhanced base
  fi
  git am -q --3way --whitespace=nowarn "$srcdir/Modrinth-Enhanced-${_tag#v}/patches/"*.patch
  if [[ "$_base" != "$_upstream" ]]; then
    git rebase -q --onto upstream base enhanced
  fi

  # upstream's scripts/set-version.sh: the sources carry 1.0.0-local, the app
  # reports the Modrinth App release it is built on
  sed -i "s/1.0.0-local/${_upstream#v}/" \
    apps/app/Cargo.toml packages/app-lib/Cargo.toml apps/app-frontend/package.json Cargo.lock

  # the production API endpoints, as upstream's scripts/build.sh selects them
  cp packages/app-lib/.env.prod packages/app-lib/.env

  # node-gyp for the native modules
  export NODE_PATH=/usr/lib/node_modules
  export TURBO_TELEMETRY_DISABLED=1
  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd app

  export RUSTUP_TOOLCHAIN=stable
  export NODE_PATH=/usr/lib/node_modules
  export TURBO_TELEMETRY_DISABLED=1
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  # keep Gradle's cache inside the build tree instead of ~/.gradle
  export GRADLE_USER_HOME="$srcdir/gradle-home"

  # Without tauri-release.conf.json, as upstream builds it: that config only
  # adds Modrinth's own updater. app-lib's build script runs Gradle, which
  # downloads itself and the agent's dependencies, so build() needs network.
  pnpm --filter=@modrinth/app run tauri build --no-bundle
}

package() {
  cd app

  # the same files, under the same names, as upstream's .deb
  install -Dm755 target/release/ModrinthEnhanced -t "$pkgdir/usr/bin/"
  ln -s ModrinthEnhanced "$pkgdir/usr/bin/modrinth-enhanced"

  install -Dm644 apps/app/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/ModrinthEnhanced.png"
  install -Dm644 apps/app/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/ModrinthEnhanced.png"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/Modrinth Enhanced.desktop" << EOF
[Desktop Entry]
Categories=Game;
Exec=ModrinthEnhanced
Icon=ModrinthEnhanced
Name=Modrinth Enhanced
Terminal=false
Type=Application
MimeType=application/x-modrinth-modpack+zip;x-scheme-handler/modrinth
EOF
}
