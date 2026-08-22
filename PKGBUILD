# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc
pkgver=2026.12.1
pkgrel=1
pkgdesc='NymVPN command-line client'
arch=('x86_64' 'aarch64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'polkit' 'nym-vpnd')
makedepends=('rust' 'cargo' 'protobuf')
provides=('nym-vpnc')
conflicts=('nym-vpnc')
options=(!debug)
source=("$url/archive/refs/tags/nym-vpn-v2026.12.1.tar.gz")
sha256sums=(38ef82a300b8529ebccad573cefe1bba09e5fa52fead744daef24f44d8ce0749)
_srcdir="nym-vpn-client-nym-vpn-v2026.12.1"

prepare() {
  pushd "$_srcdir"
  # remove unused sources
  rm -rf nym-vpn-android
  rm -rf nym-vpn-apple
  rm -rf nym-vpn-app
  rm -rf nym-vpn-windows
  popd
}

build() {
  pushd "$_srcdir"

  pushd nym-vpn-core
  # 1. sqlx does not support LTO build flag, which is enabled by default in Arch
  # set the C flag -ffat-lto-objects to solve the issue
  # see https://github.com/launchbadge/sqlx/issues/3149
  #
  # 2. aws-lc-sys v0.38: build issues related to optimizations (fixed in newer versions)
  # see: https://github.com/aws/aws-lc-rs/pull/1064
  CFLAGS+=" -ffat-lto-objects -O0" cargo build --release --locked -p nym-vpnc --verbose
  popd

  popd # _srcdir
}

package() {
  install -Dm755 "$_srcdir/nym-vpn-core/target/release/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
