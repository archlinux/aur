# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nymvpn-x
pkgver=0.1.2_dev
# upstream version
_pkgver=0.1.2-dev
_release_tag=nightly-x
pkgrel=1
pkgdesc='NymVPN next desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'bash' 'cairo' 'pango' 'gtk3' 'webkit2gtk' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup')
makedepends=('rust' 'cargo' 'protobuf' 'npm')
optdepends=('nym-vpnd: NymVPN daemon as a systemd service')
provides=('nymvpn-x')
conflicts=('nymvpn-x')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nymvpn-x-wrapper.sh'
    'nymvpn-x.desktop'
    'nymvpn-x.svg')
sha256sums=(
    'b8b040541421c7eeb833f5775200f8d84abd2a0588e87a6ac7b5aeedf95d2d39' 
    '4a68bccaa807684d2fd45832cd6df24f977e8d4e1c7a37de583c54423c21d259' 
    '8bf0dbd2a6c312630e1c2e866431d0361b24975ba17b4ab14c891efea326251c' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')
_srcdir="nym-vpn-client-$_release_tag"

prepare() {
  pushd "$_srcdir"

  # rip off all useless sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  rm -rf nym-vpn-desktop
  popd
}

build() {
  pushd "$_srcdir/nym-vpn-x"

  # install UI dependencies
  npm i

  # build app
  pushd src-tauri
  # sqlx does not support LTO build flag, which is enabled by default in Arch
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/launchbadge/sqlx/issues/3149
  CFLAGS+=" -ffat-lto-objects" npm run tauri build -- --bundles none
}

package() {
  pushd "$_srcdir/nym-vpn-x"
  install -Dm755 "src-tauri/target/release/nymvpn-x" "$pkgdir/usr/bin/nymvpn-x"
  popd

  install -Dm755 "nymvpn-x-wrapper.sh" "$pkgdir/usr/bin/nymvpn-x-wrapper.sh"
  install -Dm644 "nymvpn-x.desktop"    "$pkgdir/usr/share/applications/nymvpn-x.desktop"
  install -Dm644 "nymvpn-x.svg"        "$pkgdir/usr/share/icons/nymvpn-x.svg"
}

