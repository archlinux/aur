# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd
pkgver=1.4.0
# upstream version
_pkgver=1.4.0
_release_tag=nym-vpn-core-v1.4.0
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
    '4abc6a20a7435298bedc3618452b9a4f71b8698d77512aca30e0afa3905aad58' 
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

