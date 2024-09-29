# Maintainer:  Alexander Kobel <a-kobel@a-kobel.de>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini_real"
pkgname="${_pkgname}-git"
pkgver=1.6.1.r281.062c9cc
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
arch=('x86_64')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_pkgname}"
license=('custom:Bertini License')
makedepends=('git' 'boost>=1.50')
depends=('bertini-parallel' 'boost-libs>=1.50' 'gcc-libs' 'glibc' 'gmp' 'mpfr'
         'openmpi')
optdepends=("python-${_pkgname}: Python interface support")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)
  local version=$(sed -n 's/AC_INIT(\[bertini_real\],\[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do 
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
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
