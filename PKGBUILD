# Maintainer: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd
pkgver=0.1.6
pkgrel=1
pkgdesc='NymVPN daemon'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libnftnl' 'libmnl')
makedepends=('rust' 'cargo' 'go')
provides=('nym-vpnd')
conflicts=('nym-vpnd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/nym-vpn-core-v$pkgver.tar.gz")
sha256sums=('ff4be517ed9bc3346bff655477df860e6f7debd5138a0c72f417c94eea3091db')

prepare() {
  mv -f nym-vpn-client-nym-vpn-core-v$pkgver $pkgname-$pkgver
  pushd "$pkgname-$pkgver"

  # rip off all unneeded sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  rm -rf nym-vpn-desktop
  rm -rf nym-vpn-x
  popd
}

build() {
  pushd "$pkgname-$pkgver"

  # build wireguard-go
  pushd wireguard
  ./build-wireguard-go.sh
  popd
  wg_go=$srcdir/$pkgname-$pkgver/build/lib/$CARCH-unknown-linux-gnu

  # build nym-vpnd
  pushd nym-vpn-core/nym-vpnd/

  # sqlx does not support LTO build flag, which is enabled by default in Arch
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/launchbadge/sqlx/issues/3149
  CFLAGS+=" -ffat-lto-objects" RUSTFLAGS="-L $wg_go" cargo build --release --locked
  popd
}

package() {
  pushd "$pkgname-$pkgver/nym-vpn-core"
  install -Dvm 755 "target/release/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  popd

  systemd_unit="[Unit]
Description=NymVPN daemon
StartLimitBurst=6
StartLimitIntervalSec=24
Wants=network-pre.target
After=network-pre.target NetworkManager.service systemd-resolved.service

[Service]
ExecStart=/usr/bin/nym-vpnd
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target"

  echo "$systemd_unit" > nym-vpnd.service
  install -Dvm 644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}

