# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcl-fossil
pkgver=r35251.8e538cb
pkgrel=1
pkgdesc="The Tcl scripting language"
arch=('i686' 'x86_64')
url="https://www.tcl.tk/"
license=('custom')
depends=('glibc' 'zlib')
makedepends=('fossil')
provides=("tcl=$pkgver")
conflicts=('tcl')
options=('staticlibs')
source=("fossil+https://core.tcl-lang.org/tcl")
sha256sums=('SKIP')


pkgver() {
  cd "tcl"

  _info=$(fossil info)
  _hash=$(echo "$_info" | sed -n 's|checkout: *\([0-9a-z]*\).*|\1|p' | cut -c 1-7)
  _revision=$(echo "$_info" | sed -n 's|check-ins: *\(.*\)|\1|p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "tcl/unix"

  ./configure \
    --prefix="/usr" \
    --enable-64bit
  make
}

check() {
  cd "tcl"

  make -C "unix" test
}

package() {
  cd "tcl"

  make \
    DESTDIR="$pkgdir" \
    -C "unix" \
    install \
    install-private-headers

  ln -sf tclsh${*} "$pkgdir/usr/bin/tclsh"
  ln -sf libtcl${*}.so "${pkgdir}/usr/lib/libtcl.so"

  install -Dm644 "unix/tcl.m4" -t "$pkgdir/usr/share/aclocal"
  install -Dm644 "license.terms" -t "$pkgdir/usr/share/licenses/tcl"
}
