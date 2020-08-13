# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <christian dot krause at mailbox dot org>

pkgname=wiggletools
pkgver=1.2.4
pkgrel=1
pkgdesc="Compute genome-wide statistics with composable iterators"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'htslib' 'libbigwig' 'python2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Ensembl/WiggleTools/archive/v${pkgver}.tar.gz"
        "wiggletools-flags.patch")
sha256sums=('3d21a107321aa0ab6c96a2dae585a61e8dfca566a8c18e15b677c05b3ec64ead'
            'b945a520e71f9a9f4f62f7e737847990d9cde05d8f0ea5af75dfdd6155d3493e')

prepare() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  patch -Np1 -i "${srcdir}/wiggletools-flags.patch"

  # Use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
    -i python/wiggletools/*.py
}

build() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  make
}

check() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  make test || true
}

package() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  install -Dm755 bin/wiggletools ${pkgdir}/usr/bin/wiggletools

  for pythonscript in bin/*.py ; do
    install -Dm755 ${pythonscript} ${pkgdir}/usr/bin/$(basename ${pythonscript} .py)
  done

  for shellscript in bin/*.sh ; do
    install -Dm755 ${shellscript} ${pkgdir}/usr/bin/$(basename ${shellscript} .sh)
  done
}
