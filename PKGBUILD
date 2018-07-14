# Original: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=mrbayes
_up_pkgname=MrBayes
pkgver=3.2.6
pkgrel=2
pkgdesc="A program for the Bayesian estimation of phylogeny"
arch=('i686' 'x86_64')
license=('GPL')
url="http://nbisweden.github.io/MrBayes/"
depends=('readline')
optdepends=('beagle-lib: for using GPU calculations among other enhancements - rebuild package after installing this dep')
source=(https://github.com/NBISweden/MrBayes/archive/v${pkgver}.tar.gz)
sha256sums=('38d06dac7d0bdd948a638849397cc32d433a607946c9c86dae5d8ca16ba93f9b')

build() {
  cd ${srcdir}/${_up_pkgname}-${pkgver}
  tar xvfz ${pkgname}-${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}/src
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
  install -D -m755 ${srcdir}/${_up_pkgname}-${pkgver}/${pkgname}-${pkgver}/src/mb ${pkgdir}/usr/bin/mb
  install -D -m644 ${srcdir}/${_up_pkgname}-${pkgver}/${pkgname}-${pkgver}/documentation/commref_mb3.2.txt "$pkgdir/usr/share/doc/$pkgname/commref.txt"
}
