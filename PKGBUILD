# Maintainer:  <@gmail.com>

_pkgname=EvtGen
pkgname=evtgen
_pkgver=02.02.03
pkgver=2.2.3
pkgrel=1
pkgdesc="A Monte Carlo event generator that simulates the decays of heavy flavour particles, primarily B and D mesons."
arch=("x86_64")
url="https://evtgen.hepforge.org/"
license=('GPL3')
options=('staticlibs')
makedepends=(cmake)
depends=(hepmc lhapdf pythia8 photos)
source=("EvtGen.tar.gz::https://evtgen.hepforge.org/downloads?f=EvtGen-$_pkgver.tar.gz"
        "pythia8-lowercase-include.patch")
sha256sums=('b642700b703190e3304edb98ff464622db5d03c1cfc5d275ba4a628227d7d6d0'
            'b5bd5f07b9ee384f5649785bc430089283b10a15a51b8619613941309b6a7ebb')

prepare() {
  cp pythia8-lowercase-include.patch "${_pkgname}/R$(echo ${_pkgver} | tr . -)/"
  cd "${_pkgname}/R$(echo ${_pkgver} | tr . -)"
  patch -p1 < pythia8-lowercase-include.patch
  rm -rf CMakeCache.txt CMakeFiles
  mkdir -p ../../build
}

build() {
  cd "${_pkgname}/R$(echo ${_pkgver} | tr . -)"
  cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" -B ../../build \
		-DEVTGEN_HEPMC3:BOOL=ON  -DHEPMC3_ROOT_DIR:PATH=/usr \
		-DEVTGEN_PYTHIA:BOOL=ON  -DPYTHIA8_ROOT_DIR:PATH=/usr \
		-DEVTGEN_PHOTOS:BOOL=ON  -DPHOTOSPP_ROOT_DIR:PATH=/usr \
		-DEVTGEN_TAUOLA:BOOL=ON  -DTAUOLAPP_ROOT_DIR:PATH=/usr
  cd ../../build
  make
}

package() {
  cd "build"
  make DESTDIR="$pkgdir" install
}
