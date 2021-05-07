# Maintainer: Guoyi ("malacology") <guoyizhang at malacology.net>
# Contributor: Guoyi ("malacology") <guoyizhang at malacology.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=mrbayes-mpi
pkgver=3.2.7
pkgrel=2
pkgdesc="MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models"
arch=('i686' 'x86_64')
url="nbisweden.github.io/mrbayes/"
license=('GPL3')
depends=('openmpi')
# conflicts=(mrbayes)
# provides=(mrbayes)
source=("git+https://github.com/NBISweden/MrBayes.git")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/MrBayes
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
  cd ${srcdir}/MrBayes
  make install
  install ${pkgdir}/usr/bin/mb ${pkgdir}/usr/bin/mb-mpi
}
