# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=namd
pkgver=2.14
_charmver=6.10.2
pkgrel=3
pkgdesc="Scalable molecular dynamic engine"
url="http://www.ks.uiuc.edu/Research/namd/"
license=(custom)
arch=(x86_64)
depends=(gcc fftw tcl)
makedepends=(make patch)
md5sums=('7a827066e0d7f2a37f748ca9f165ea80'
         '3dee29385fed05eb8f3d2d38dd799383'
         '2b5fe6cfcdc2ce44da9329cf0d30a071')
options=(!buildflags)

# You MUST download the package from the NAMD url and put it in the PKGBUILD folder!
source=("http://charm.cs.illinois.edu/distrib/charm-${_charmver}.tar.gz"
        "local://NAMD_${pkgver}_Source.tar.gz"
        "namd.patch")

prepare() {
  cd "${srcdir}/NAMD_${pkgver}_Source"

  # move Charm++ in place
  mv "${srcdir}/charm-v${_charmver}" "${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}"

  # apply patch
  patch -Np0 -i "${srcdir}/namd.patch"
}

build() {
  # build Charm++
  cd "${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}"

  ./build charm++ multicore-linux64 --with-production

  # go to the NAMD build
  cd "${srcdir}/NAMD_${pkgver}_Source"

  # configure and build NAMD
  ./config Linux-x86_64-g++ --charm-arch multicore-linux64 --with-fftw3
  cd Linux-x86_64-g++
  make
}

package() {
  cd "${srcdir}/NAMD_${pkgver}_Source/Linux-x86_64-g++"

  make release

  # prepare directories
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  cd NAMD_${pkgver}_Linux-x86_64-multicore

  # install binaries
  install -Dm755 charmrun "${pkgdir}/usr/bin/charmrun"
  install -Dm755 flipbinpdb "${pkgdir}/usr/bin/flipbinpdb"
  install -Dm755 flipdcd "${pkgdir}/usr/bin/flipdcd"
  install -Dm755 namd2 "${pkgdir}/usr/bin/namd2"
  install -Dm755 psfgen "${pkgdir}/usr/bin/psfgen"
  install -Dm755 sortreplicas "${pkgdir}/usr/bin/sortreplicas"

  # install license
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install other stuff
  cp -ar lib README.txt announce.txt notes.txt "${pkgdir}/usr/share/${pkgname}/"
}
