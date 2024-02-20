# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=qatlib
pkgver=24.02.0
pkgrel=1
pkgdesc="User space library for Intel(R) QuickAssist Technology"
url="https://github.com/intel/qatlib"
license=(BSD-3-Clause)
arch=(x86_64)
depends=(
  bash
  glibc
  libcrypto.so
)
makedepends=(
  nasm
  systemd
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "qatlib.sysusers"
)
sha256sums=(
  'ffef9a3a2bd6024b188977411944ec6267da34d40a0c6c1d42c4f59165991176'
  '67ccaef8fc91484bf103ee6e321d03f820f633cc2a8d73926b568bd9a358bd8f'
)

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  mkdir -p m4
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_archive"

  make \
    prefix="$pkgdir/usr" \
    sbindir="$pkgdir/usr/bin" \
    systemdsystemunitdir="$pkgdir/usr/lib/systemd/system" \
    systemd_scriptsdir="$pkgdir/usr/bin" \
    install
  install -Dm644 "$srcdir/qatlib.sysusers" "$pkgdir/usr/lib/sysusers.d/qatlib.conf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
