# Maintainer:  Alexander Kobel <a-kobel@a-kobel.de>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini_real"
pkgname="${_pkgname}-git"
pkgver=1.6.1.r280.6bd1ddf
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
arch=('x86_64')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_pkgname}"
license=('custom:Bertini license')
makedepends=('git' 'boost>=1.50')
depends=('glibc' 'gcc-libs' 'boost-libs>=1.50' 'bertini-parallel' 'gmp' 'mpfr'
         'openmpi')
optdepends=("python-${_pkgname}: Python interface support"
            "${_pkgname}-docs: XHTML documentation")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_decomposition_hpp.patch")
sha256sums=('SKIP'
            '38a788d71f39228a88225ce291de4218ec609215ab09ef10707f6cf4050002aa')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/AC_INIT(\[bertini_real\],\[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}_fix"*".patch"; do 
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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
