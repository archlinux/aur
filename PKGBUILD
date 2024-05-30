# Maintainer:

_pkgname="vdhcoapp"
pkgname="$_pkgname-git"
pkgver=2.0.19.r4.g0b40d3e
pkgrel=2
pkgdesc="Companion application for Video DownloadHelper browser add-on"
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL-2.0-or-later')
arch=('x86_64')

makedepends=(
  'esbuild'
  'jq'
  'yq'

  # AUR
  'nvm'
)

options=('emptydirs' '!strip' '!debug')
install="$_pkgname.install"

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# filepicker
depends+=(
  'at-spi2-core'
  'gdk-pixbuf2'
  'gtk3'
  'pango'
)
makedepends+=(
  'cargo'
  'git'
)

_filepicker_url="https://github.com/paulrouget/static-filepicker"
_filepicker_pkgsrc="vdhcoapp-filepicker"
source+=("$_filepicker_pkgsrc"::"git+$_filepicker_url.git")
sha256sums+=('SKIP')

_cargo_env() {
  export CARGO_HOME="$SRCDEST/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

_nvm_env() {
  : ${_nodeversion:=18}

  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

_filepicker_prepare() {
  _cargo_env

  cd "$srcdir/$_filepicker_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_filepicker_build() {
  _cargo_env

  cd "$srcdir/$_filepicker_pkgsrc"
  cargo build --frozen --release --all-features
}

_filepicker_package() {
  install -Dm755 "$srcdir/$_filepicker_pkgsrc/$CARGO_TARGET_DIR/release/filepicker" -t "$pkgdir/usr/bin/"
}

prepare() {
  cd "$_pkgsrc"
  mv -f app/* .

  # create config.json
  tomlq . ./config.toml \
    | jq '.target.os = "linux"' \
    | jq '.target.arch = "amd64"' \
      > src/config.json

  # fix path to config.json
  sed -E -i src/main.js src/native-autoinstall.js \
    -e 's&^(const config = require\('\'')(config.json'\''\);)$&\1./\2&'

  _filepicker_prepare
}

build() {
  _nvm_env

  # build
  cd "$_pkgsrc"

  npm install --no-package-lock --no-audit --no-fund --prefer-offline
  npm install pkg --no-package-lock --no-audit --no-fund --prefer-offline

  local _esbuild_options=(
    src/main.js
    --target=esnext
    "--banner:js=const _importMetaUrl=require('url').pathToFileURL(__filename)"
    "--define:import.meta.url=_importMetaUrl"
    --format=cjs
    --bundle
    --platform=node
    --tree-shaking=true
    --alias:electron=electron2
    --outfile=bundled.js
  )

  esbuild "${_esbuild_options[@]}"

  local _pkg_options=(
    bundled.js
    --target "node$_nodeversion-linux-x64"
    --output vdhcoapp
  )

  ./node_modules/.bin/pkg "${_pkg_options[@]}"

  _filepicker_build
}

package() {
  depends+=('ffmpeg')

  cd "$_pkgsrc"

  install -Dm755 vdhcoapp -t "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/edge/native-messaging-hosts/"

  _filepicker_package
}
