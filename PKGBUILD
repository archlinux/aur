# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Kobel <a-kobel@a-kobel.de>

pkgname="bertini_real"
pkgver=1.6.1
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
arch=('x86_64')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${pkgname}"
license=('custom:Bertini License')
makedepends=('boost>=1.50')
depends=('bertini-parallel' 'boost-libs>=1.50' 'gcc-libs' 'glibc' 'gmp' 'mpfr'
         'openmpi')
optdepends=("python-${pkgname}: Python interface support")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_fix_include.patch::${_url}/commit/062c9cc1964d4e2a7b0c6c117419f9b98b0a71f3.patch")
sha256sums=('25199494ed43de5f0cbffed15d108203da0308130cf3e1b0f0d6dd70621f8c47'
            'e5e580413a4665a91b201e88a5048937a58ee7b90fd4184603ae1e61f2724593')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[bertini_real\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
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
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
