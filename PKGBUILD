# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpn-app
pkgver=1.3.0
# upstream version
_pkgver=1.3.0
_release_tag=nym-vpn-app-v1.3.0
pkgrel=1
pkgdesc='NymVPN desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme' 'nym-vpnd')
makedepends=('rust' 'cargo' 'protobuf' 'npm')
provides=('nym-vpn-app')
conflicts=('nym-vpn-app')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    'f05f50ba61821a7019f8b051b3058eaa3046cddbd7bb2a927efa4e15b55cbe13' 
    '89d01a49dac087c987b2741dddb3bcb9e7f1461d9c0f50b7f75044ed45db575e' 
    '8058039c52c588e38285971c4c37d50fdb8e05e50bbc19d7ffeb89d662a21f1e')
_srcdir="nym-vpn-client-$_release_tag"

prepare() {
  pushd "$_srcdir"

  # rip off useless sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  popd
}

build() {
  pushd "$_srcdir/nym-vpn-app"

  # install Js dependencies
  npm i

  # build app
  pushd src-tauri

  export RUSTUP_TOOLCHAIN=stable
  # LTO build flag is enabled by default in Arch's makepkg config
  # but `zstd` fails to build with LTO (dependency of `build-info` crate)
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/mozilla/sccache/issues/862
  # https://github.com/launchbadge/sqlx/issues/3149
  export CFLAGS+=' -ffat-lto-objects'

  npm run tauri build -- --no-bundle
}

package() {
  pushd "$_srcdir/nym-vpn-app"
  install -Dm755 "src-tauri/target/release/nym-vpn-app" "$pkgdir/usr/bin/nym-vpn-app"
  popd

  install -Dm644 "nym-vpn.desktop" "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}

