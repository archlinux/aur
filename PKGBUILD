# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd
pkgver=0.2.4
# upstream version
_pkgver=0.2.4
_release_tag=nym-vpn-core-v0.2.4
pkgrel=1
pkgdesc='NymVPN daemon as a systemd service'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libnftnl' 'libmnl')
makedepends=('rust' 'cargo' 'go' 'protobuf')
provides=('nym-vpnd')
conflicts=('nym-vpnd')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_release_tag.tar.gz"
    'nym-vpnd.service')
sha256sums=(
    '2646177dfbcfae8583a973275dd9ac1b1138adf723443d60c840d6e401e54ab1' 
    'e8e234098c198ba3d0692543922fc53434f9a4355338d01c5a8dd5abfb97d255')
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
  wg_go=$srcdir/$_srcdir/build/lib/$CARCH-unknown-linux-gnu

  # build nym-vpnd
  pushd nym-vpn-core/crates/nym-vpnd/

  # sqlx does not support LTO build flag, which is enabled by default in Arch
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/launchbadge/sqlx/issues/3149
  CFLAGS+=" -ffat-lto-objects" RUSTFLAGS="-L $wg_go" cargo build --release --locked
}

package() {
  pushd "$_srcdir/nym-vpn-core"
  install -Dm755 "target/release/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}

