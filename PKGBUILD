# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="paramotopy"
pkgver=1.0.3.7
_commit="36121881a137cf29c7f662bd792a0e823d5742f2" # 1.0.3.7
pkgrel=2
pkgdesc="Parallel parameter homotopy through Bertini"
arch=('x86_64')
url="https://paramotopy.com"
_url="https://github.com/ofloveandhate/${pkgname}"
license=('custom:Paramotopy license')
depends=('bertini' 'boost-libs>=1.53' 'gcc-libs' 'glibc' 'mpfr' 'openmpi')
makedepends=('boost>=1.53' 'gmp')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_deprecated_boost_timer.patch")
sha256sums=('4f04d932c540d68d69d2d8605699921c4e98227016999056b8afbe5d630ca54a'
            'e355ddea4c31f22c008e63f0418a2a6e77103b6779763a817604daaa3b644c21')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_deprecated_boost_timer.patch"

  sed -i 's/1\.3\.7/1.0.3.7/g' "COPYING"
}

build() {
  CPPFLAGS+=" -I/usr/include/bertini"
  LDFLAGS+=" -L/usr/lib/bertini"

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  # install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
