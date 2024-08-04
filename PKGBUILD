# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini2"
pkgname="${_pkgname}-git"
pkgver=r1680.78f9986
pkgrel=1
pkgdesc="The redevelopment of Bertini in C++"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'boost>=1.83' 'gmp' 'mpfr' 'libmpc' 'eigen>=3.3')
depends=('glibc' 'gcc-libs' 'boost-libs>=1.83' 'gmp' 'mpfr' 'libmpc')
optdepends=('pybertini: Python interface support'
            'bertini2-docs: HTML documentation')
provides=("${_pkgname}" 'libbertini2.so')
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/core"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/core"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "core"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"

  cd "${srcdir}/${_pkgsrc}/licenses"
  install -Dm644 "GNU GENERAL PUBLIC LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/GPL-3.0-or-later"
  install -Dm644 "BERTINI2_ADDITIONAL_GPL_TERMS" "${pkgdir}/usr/share/licenses/${_pkgname}/Bertini2-Additional-GPL-Terms"
}
