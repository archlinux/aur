# Maintainer:
# Contributor: Damien Guihal <dguihal@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_pkgname="vdhcoapp"
pkgname="$_pkgname"
pkgver=2.0.19
pkgrel=1
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

options=(!strip emptydirs)
install="$_pkgname.install"

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums+=('2fedba42f5d1f207c92938e99cd3fcf0af351820e88ab0df5fcbf7b68ae51d23')

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

_filepicker_prepare() {
  export CARGO_HOME="${CARGO_HOME:-$SRCDEST/cargo-home}"
  export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
  export CARGO_TARGET_DIR=target

  cd "$srcdir/$_filepicker_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_filepicker_build() {
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
  : ${_nodeversion:=18}

  export HOME="$srcdir/node-home"
  export NVM_DIR="${SRCDEST:-${startdir:-$srcdir}}/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

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
