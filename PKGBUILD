# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="bertini2"
pkgver=2.0.alpha8
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91" # 2.0-alpha8
pkgrel=2
pkgdesc="The redevelopment of Bertini in C++"
arch=('x86_64')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
depends=('boost-libs>=1.71' 'gcc-libs' 'glibc' 'gmp' 'libmpc' 'mpfr')
makedepends=('boost>=1.71' 'eigen>=3.3')
optdepends=('pybertini: Python interface support')
provides=("lib${pkgname}.so")
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('41471b4e0b4aeab92c0a1402bd21da9c69cfdf1c787d92eb80d35bb0b9db62f4')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/core"
  sed -n 's/.*AC_INIT(\[[^]]*\], \[\([^]]*\)\].*/\1/p' configure.ac | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_pkgsrc}/core"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr'
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}/core"
  make check TESTS="\
    b2_classic_compatibility_test \
    generating_test \
    settings_test" # \
    # b2_class_test \
    # endgames_test \
    # nag_algorithms_test \
    # nag_datatypes_test \
    # pool_test \
    # tracking_basics_test"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "core"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  # install -vDm644 "NEWS"    "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"

  cd "${srcdir}/${_pkgsrc}/licenses"
  install -vDm644 "GNU GENERAL PUBLIC LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-or-later"
  install -vDm644 "BERTINI2_ADDITIONAL_GPL_TERMS" "${pkgdir}/usr/share/licenses/${pkgname}/Bertini2-Additional-GPL-Terms"
}
