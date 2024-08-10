# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini2"
pkgname="${_pkgname}-git"
pkgver=2.0.alpha8.r76.78f9986
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91"
pkgrel=1
pkgdesc="The redevelopment of Bertini in C++"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'boost>=1.83' 'eigen>=3.3')
depends=('glibc' 'gcc-libs' 'boost-libs>=1.83' 'gmp' 'mpfr' 'libmpc')
optdepends=('pybertini: Python interface support'
            'bertini2-docs: HTML documentation')
provides=("${_pkgname}=${pkgver%%.r*}" "libbertini2.so=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/core"
  local version=$(sed -n 's/AC_INIT(\[b2\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
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

check() {
  # Only some tests work
  cd "${srcdir}/${_pkgsrc}/core"
  make check TESTS="\
    b2_classic_compatibility_test \
    generating_test \
    settings_test"
    # b2_class_test \
    # endgames_test \
    # nag_algorithms_test \
    # nag_datatypes_test \
    # pool_test \
    # tracking_basics_test
}

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
