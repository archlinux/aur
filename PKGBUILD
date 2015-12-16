# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.20.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=(
    "https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    '53c73d6642e1daa0779a5dcd7970a7446b625e1b32f86035e80f0e7cefd93291'
)

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
  make test
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
