# Maintainer: Guoyi ("malacology") <guoyizhang at malacology.net>
# Contributor: Guoyi ("malacology") <guoyizhang at malacology.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=mrbayes-mpi-beagle
pkgver=3.2.7
pkgrel=10
pkgdesc="MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. https://doi.org/10.1093/sysbio/sys029"
arch=('i686' 'x86_64')
url="nbisweden.github.io/mrbayes/"
license=('GPL3')
depends=('openmpi' 'readline' 'gcc' 'beagle-lib')
conflicts=(mrbayes)
provides=(mrbayes)
source=("https://github.com/NBISweden/MrBayes/archive/v${pkgver}.tar.gz")
sha256sums=('64da39c01f606d0413ce90a1dd3c1ce2cbdef4cbad99aee8a4b2391a2e8db244')

build() {
  cd ${srcdir}/MrBayes-$pkgver
  #Build with beagle-lib support if available:
  if [ -f /usr/lib/libhmsbeagle.so ]
  then
    msg "beagle-lib found! Building with CUDA support."
    ./configure --with-beagle=/usr --prefix=${pkgdir}/usr --enable-mpi=yes
  else
    msg "beagle-lib not found! Building without CUDA support."
    ./configure --with-beagle=no --prefix=${pkgdir}/usr --enable-mpi=yes
  fi
  make
}
package() {
  cd ${srcdir}/MrBayes-$pkgver
  make install
  install ${pkgdir}/usr/bin/mb ${pkgdir}/usr/bin/mb-mpi
}
