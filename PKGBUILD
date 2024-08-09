# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

pkgname="bertini_real"
pkgver=1.6.1
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${pkgname}"
license=('custom:Bertini license')
makedepends=('boost>=1.50')
depends=('glibc' 'gcc-libs' 'boost-libs' 'bertini' 'gmp' 'mpfr' 'openmpi')
optdepends=('python-bertini_real: Python interface support'
            'bertini_real-docs: XHTML documentation')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_fix_decomposition_hpp.patch")
sha256sums=('25199494ed43de5f0cbffed15d108203da0308130cf3e1b0f0d6dd70621f8c47'
            '38a788d71f39228a88225ce291de4218ec609215ab09ef10707f6cf4050002aa')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[bertini_real\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}_fix"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  CPPFLAGS+=" -I/usr/include/bertini"
  LDFLAGS+=" -L/usr/lib/bertini -lboost_timer"
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
