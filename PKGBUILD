# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.35.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf' 'ocaml')
makedepends=('ocamlbuild')
url="http://flowtype.org"
license=('BSD')
source=(
    "https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
    'Makefile-fPIC.patch'
    'remove-unused-module.patch'
    'Makefile-no-flow-check.patch'
)
sha256sums=(
    'c60efe9da95b578705ac61a4666af93a37401d973c37edae1865cd734aa2b95b'
    '4df293e75de2461e0d741a1a6c4448494f4b2cd9bcc0ea3eb2dd41d64b49e730'
    '341f98ac49d68f292d25e026f66e65936c2d95350052910d20ea73fa6e710c33'
    'bc27443a2b5437bd24c37247fc9bb2ab1a062afcea43a03be673dd23fa45bcba'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 <"${srcdir}/../Makefile-fPIC.patch"
  patch -p1 <"${srcdir}/../remove-unused-module.patch"
  patch -p1 <"${srcdir}/../Makefile-no-flow-check.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Building...'
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # This ugly hack comes after conversations on #flowtype suggest that the 
  # incremental tests are not necessarily reliable - they fail when they
  # shouldn't, and not reliably, and with different frequencies on different
  # platforms. So let's be done with them for now...
  rm -r tests/incremental*

  msg 'Checking...'
  if test -z "${FLOW_RUNTESTS_PARALLELISM}" ; then
    /usr/bin/env FLOW_RUNTESTS_PARALLELISM=2 make test
  else
    make test
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Installing license...'
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg 'Installing documentation...'
  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -dpr --no-preserve=ownership examples "${pkgdir}/usr/share/doc/${pkgname}"

  msg 'Installing...'
  install -Dm 755 bin/flow "${pkgdir}/usr/bin/flow"
}
