# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=qatlib
pkgver=24.09.0
pkgrel=1
pkgdesc="User space library for Intel(R) QuickAssist Technology"
url="https://github.com/intel/qatlib"
license=(BSD-3-Clause)
arch=(x86_64)
depends=(
  bash
  glibc
  libcrypto.so
  numactl
)
makedepends=(
  nasm
  systemd
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "qatlib.sysusers"
)
sha256sums=(
  '303e547da0b9590f6641b8a71e65217acdf4771333eb060aed43bd904589e2d1'
  '67ccaef8fc91484bf103ee6e321d03f820f633cc2a8d73926b568bd9a358bd8f'
)

build() {
  cd $pkgname-$pkgver
  mkdir -p m4
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make \
    prefix="$pkgdir/usr" \
    sbindir="$pkgdir/usr/bin" \
    systemdsystemunitdir="$pkgdir/usr/lib/systemd/system" \
    systemd_scriptsdir="$pkgdir/usr/bin" \
    install
  install -vDm644 "$srcdir/qatlib.sysusers" "$pkgdir/usr/lib/sysusers.d/qatlib.conf"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
