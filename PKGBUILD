# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd
pkgver=1.13.1
# upstream version
_pkgver=1.13.1
_release_tag=nym-vpn-core-v1.13.1
pkgrel=1
pkgdesc='NymVPN daemon as a systemd service'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus')
makedepends=('rust' 'cargo' 'go' 'protobuf')
provides=('nym-vpnd')
conflicts=('nym-vpnd')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nym-vpnd.service')
sha256sums=(
    '2ef74ecbca4452ebe8eccdfe2be65336a1231e0f6d34f100d024f6cd6774abd8' 
    '610644dffd7f69f7f5ee5b8688b04ce6b254c6e09c1392fb99cd91a65eb76032')
_srcdir="nym-vpn-client-$_release_tag"

prepare() {
  pushd "$_srcdir"

  # rip off all useless sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  rm -rf nym-vpn-app
  popd
}

build() {
  pushd "$_srcdir"

  # build wireguard-go
  pushd wireguard
  ./build-wireguard-go.sh
  popd

  # build nym-vpnd
  pushd nym-vpn-core/crates/nym-vpnd/

  # sqlx does not support LTO build flag, which is enabled by default in Arch
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/launchbadge/sqlx/issues/3149
  CFLAGS+=" -ffat-lto-objects" cargo build --release --locked
}

package() {
  pushd "$_srcdir/nym-vpn-core"
  install -Dm755 "target/release/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}

