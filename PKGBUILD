# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpn-app
pkgver=1.20.3
# upstream version
_pkgver=1.20.3
_release_tag=nym-vpn-app-v1.20.3
pkgrel=1
pkgdesc='NymVPN desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'nym-vpnd')
makedepends=('rust' 'cargo' 'protobuf' 'npm')
provides=('nym-vpn-app')
conflicts=('nym-vpn-app')
# disable lto as optimizations are set in the cargo profile (Cargo.toml)
# with lto enabled here, the build fails (because `zstd`)
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    '165b55a80b488bfe105ea3eea2bdad50ac648f1353956f9afc0275225651391a' 
    '143fd3eb05ccc8d714cda55c83221ffe6c5f83d85d5cce8407c188a8e72952d8' 
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

  export RUSTUP_TOOLCHAIN=stable
  npm run tauri build -- --no-bundle
}

package() {
  pushd "$_srcdir/nym-vpn-app"
  install -Dm755 "src-tauri/target/release/nym-vpn-app" "$pkgdir/usr/bin/nym-vpn-app"
  popd

  install -Dm644 "nym-vpn.desktop" "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}

