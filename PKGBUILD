# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=qatlib
pkgver=23.11.0
pkgrel=1
pkgdesc="User space library for Intel(R) QuickAssist Technology"
url="https://github.com/intel/qatlib"
license=(BSD)
arch=(x86_64)
makedepends=(
  nasm
  systemd
  glibc
)
depends=(
  bash
  glibc
  libcrypto.so
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "qatlib.sysusers"
)
sha256sums=(
  'f649613c243df98c2b005e58af7e0c9bb6d9638e0a12d2757d18d4930bf893cd'
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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
