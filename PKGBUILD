# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=namd
pkgver=2.14
_charmver=6.10.2
pkgrel=1
pkgdesc="Scalable molecular dynamic engine"
url="http://www.ks.uiuc.edu/Research/namd/"
license=(custom)
arch=(x86_64)
depends=(gcc9 gcc9-libs)
makedepends=(make patch fftw-static tcl85-static)
md5sums=('7a827066e0d7f2a37f748ca9f165ea80'
         '3dee29385fed05eb8f3d2d38dd799383'
         'b60e4b2ed31ee80140858dfea8abb44d')
options=(staticlibs !buildflags)

# You MUST download the package from the NAMD url and put it in the PKGBUILD folder!
source=("http://charm.cs.illinois.edu/distrib/charm-${_charmver}.tar.gz"
        "local://NAMD_${pkgver}_Source.tar.gz"
        "namd.patch")

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

  CC=gcc-9 CXX=g++-9 ./build charm++ multicore-linux64 --with-production

  # go to the NAMD build
  cd ${srcdir}/NAMD_${pkgver}_Source

  # configure and build NAMD
  ./config Linux-x86_64-g++ --charm-arch multicore-linux64 --with-fftw3 --cc gcc-9 --cxx g++-9
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

  # create links to executables
  ln -sf /opt/${pkgname}/charmrun ${pkgdir}/usr/bin/charmrun
  ln -sf /opt/${pkgname}/flipbinpdb ${pkgdir}/usr/bin/flipbinpdb
  ln -sf /opt/${pkgname}/flipdcd ${pkgdir}/usr/bin/flipdcd
  ln -sf /opt/${pkgname}/namd2 ${pkgdir}/usr/bin/namd2
  ln -sf /opt/${pkgname}/psfgen ${pkgdir}/usr/bin/psfgen
  ln -sf /opt/${pkgname}/sortreplicas ${pkgdir}/usr/bin/sortreplicas
}
