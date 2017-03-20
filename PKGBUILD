# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=piplib
pkgver=1.4.0
pkgrel=3
pkgdesc="Parametric Integer Programming Library"
arch=(x86_64)
url="http://www.piplib.org/"
license=('LGPL')
depends=("gmp")
provides=("piplib")
source=(http://www.bastoul.net/cloog/pages/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('f5d1c7d45c5c40c0d64fa7d6bb143740')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-gmp=system
  sed -i 's/ECHO/echo/' libtool
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  for lib in ${pkgdir}/usr/lib/libpiplib*.so*; do
    lib=$(basename "${lib}")
    new_name=$(echo "${lib}" | sed 's/32/_sp/;s/64/_dp/;s/MP/_gmp/')
    ln -s "${lib}" "${pkgdir}/usr/lib/${new_name}"
  done
}
