# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=namd
pkgver=2.13
_charmver=6.8.2
pkgrel=1
pkgdesc="Scalable molecular dynamic engine"
url="http://www.ks.uiuc.edu/Research/namd/"
license=('custom')
arch=('x86_64')
depends=('gcc7' 'gcc7-libs')
makedepends=('make' 'patch' 'fftw-static' 'tcl85-static')
md5sums=('a887a34b638a5b2f7fcf7ff3c262496d'
         '9e3323ed856e36e34d5c17a7b0341e38'
         '835ce380b799d847347999e62966b411'
         'fed5c77446090c38d8811b82737d4539')
options=(staticlibs !buildflags)

# You MUST download the package from the NAMD url and put it in the PKGBUILD folder!
source=("http://charm.cs.illinois.edu/distrib/charm-${_charmver}.tar.gz"
        "local://NAMD_${pkgver}_Source.tar.gz"
        "namd.patch"
        "namd2")

prepare() {
  cd ${srcdir}/NAMD_${pkgver}_Source

  # move Charm++ in place
  mv ${srcdir}/charm-v${_charmver} ${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}

  # apply patch
  patch -Np0 -i "${srcdir}/namd.patch"
}

build() {
  # build Charm++
  cd ${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}

  CC=gcc-7 CXX=g++-7 ./build charm++ multicore-linux64 --with-production

  # go to the NAMD build
  cd ${srcdir}/NAMD_${pkgver}_Source

  # configure and build NAMD
  ./config Linux-x86_64-g++ --charm-arch multicore-linux64 --with-fftw3 --cc gcc-7 --cxx g++-7
  cd Linux-x86_64-g++
  make
}

package() {
  cd ${srcdir}/NAMD_${pkgver}_Source/Linux-x86_64-g++

  make release

  # prepare directories
  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin

  # install stuff
  mv NAMD_${pkgver}_Linux-x86_64-multicore ${pkgdir}/opt/${pkgname}

  # install license
  install -Dm644 ${pkgdir}/opt/${pkgname}/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # install wrappers
  install -Dm755 ${srcdir}/namd2 ${pkgdir}/usr/bin/namd2
}
