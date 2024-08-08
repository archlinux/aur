# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="bertini2"
pkgver=2.0.alpha8
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91"
pkgrel=1
pkgdesc="The redevelopment of Bertini in C++"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('boost>=1.71' 'eigen>=3.3')
depends=('glibc' 'gcc-libs' 'boost-libs>=1.71' 'gmp' 'mpfr' 'libmpc')
optdepends=('pybertini: Python interface support'
            'bertini2-docs: HTML documentation')
provides=("${pkgname}" 'libbertini2.so')
conflicts=("${pkgname}")
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('41471b4e0b4aeab92c0a1402bd21da9c69cfdf1c787d92eb80d35bb0b9db62f4')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/core"
  sed -n 's/AC_INIT(\[b2\],\[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./'
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
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "core"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"

  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"

  cd "${srcdir}/${_pkgsrc}/licenses"
  install -Dm644 "GNU GENERAL PUBLIC LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-or-later"
  install -Dm644 "BERTINI2_ADDITIONAL_GPL_TERMS" "${pkgdir}/usr/share/licenses/${pkgname}/Bertini2-Additional-GPL-Terms"
}
