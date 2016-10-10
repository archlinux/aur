# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=spglib
pkgname="${_pkgname}-git"
pkgver=1.9.5.r564.951c47c
pkgrel=1
pkgdesc="C library for finding and handling crystal symmetries"
url="http://atztogo.github.io/spglib/"
arch=("i686" "x86_64")
license=("BSD")
depends=("glibc")
makedepends=("git" "automake" "autoconf" "libtool" "gcc")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/atztogo/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 6 | tr -d "v,")
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  aclocal
  autoheader
  libtoolize
  touch INSTALL NEWS README AUTHORS
  automake -acf
  autoconf

  # This also calls make!
  ./configure \
      --prefix=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
