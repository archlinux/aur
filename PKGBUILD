# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <christian dot krause at mailbox dot org>

pkgname=wiggletools
pkgver=1.2.8
pkgrel=1
pkgdesc="Compute genome-wide statistics with composable iterators"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'htslib' 'libbigwig' 'python2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Ensembl/WiggleTools/archive/v${pkgver}.tar.gz"
        "wiggletools-flags.patch")
sha256sums=('0c2119480208ae09ea3eba249c1a3a69bcccbdb97dcd1fb2e55f3deee0404b73'
            'ea25efb9f4308f2d9b65cfd153baa107afce482fdbce746cfdb3e2b5f20312ef')

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
