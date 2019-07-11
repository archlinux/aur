# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=wiggletools
pkgver=1.2.3
pkgrel=1
pkgdesc="Compute genome-wide statistics with composable iterators"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'htslib' 'libbigwig' 'python2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Ensembl/WiggleTools/archive/v${pkgver}.tar.gz"
        "wiggletools-flags.patch")
sha256sums=('2adc6c0f1738e604aa20a60b1c79ea36bc8cd030a2b6039b8e5ddc31c2bf846c'
            'f04db62c23166bc49de9c9bd3d8e221011714b95059b1436bb9ec1d3902a7dcd')

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
