# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.23.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=(
    "https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
    'Makefile-fPIC.patch'
)
sha256sums=(
    'f053841511381af3b1bc3d5c682a675ee4cc66fb5dfd4843783e412b31e8464d'
    '85c7dc96e0ad270edc8f5dc631069282fb5be4a044a80878cd357642316066b8'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 <"${srcdir}/../Makefile-fPIC.patch"
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
