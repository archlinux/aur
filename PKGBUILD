# Original: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=mrbayes
pkgver=3.2.5
pkgrel=1
pkgdesc="A program for the Bayesian estimation of phylogeny"
arch=('i686' 'x86_64')
license=('GPL')
url="http://mrbayes.csit.fsu.edu"
depends=('readline')
optdepends=('beagle-lib: for using GPU calculations among other enhancements - rebuild package after installing this dep')
source=(http://downloads.sourceforge.net/mrbayes/${pkgname}-${pkgver}.tar.gz)
md5sums=('cbd21bf0497429dd9a912c28ce78812a')

build() {
  #MrBayes requires specific LDFLAGS and CFLAGS specified in the makefile. Thus we unset our own.
  #unset LDFLAGS
  #unset CFLAGS
  #unset CCFLAGS

  cd ${srcdir}/src
  autoconf
  #Build with beagle-lib support if available:
  if [ -f /usr/lib/libhmsbeagle.so ]
  then
    msg "beagle-lib found! Building with CUDA support."
    ./configure --with-beagle=/usr
  else
    msg "beagle-lib not found! Building without CUDA support."
    ./configure --with-beagle=no
  fi
  make
}
package() {
  install -D -m755 ${srcdir}/src/mb ${pkgdir}/usr/bin/mb
}
