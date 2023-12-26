# Maintainer: Sun Jiao ("Interaccoonale")
# Contributor: Sun Jiao ("Interaccoonale")

pkgname=mrbayes-mpi-git
pkgver=3.2.7.r15.a3903b3b
pkgrel=1
pkgdesc="MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. https://doi.org/10.1093/sysbio/sys029"
arch=('i686' 'x86_64')
url="nbisweden.github.io/MrBayes"
license=('GPL3')
depends=('openmpi' 'readline' 'gcc')
optdepends=('beagle-lib: for using GPU calculations among other enhancements - rebuild package after installing this dep')
conflicts=('mrbayes' 'mrbayes-beagle' 'mrbayes-mpi' 'mrbayes-mpi-beagle')
provides=(mrbayes)
provides=("mrbayes=${pkgver%%.r*}")
source=("git+https://github.com/NBISweden/MrBayes.git")
b2sums=('SKIP')

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
