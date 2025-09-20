# Maintainer: Jose Luis Cercos Pita <jlcercos@gmail.com>
pkgname=aquagpusph
pkgver=5.1.0
pkgrel=1
pkgdesc="Free CFD software based on SPH and accelerated with OpenCL"
arch=('x86_64')
url="http://canal.etsin.upm.es/aquagpusph/"
license=('GPL-3.0-or-later')
groups=()
depends=(gcc-libs glibc python python-numpy xerces-c ocl-icd muparser eigen vtk openmpi python-scipy python-matplotlib)
makedepends=(git cmake vim base-devel opencl-headers nlohmann-json)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
_tag=v${pkgver}
_sourceName="aquagpusph"
source=("git+https://github.com/sanguinariojoe/aquagpusph.git#tag=${_tag}")
noextract=()
sha256sums=('98666ec13dd21c5a9576a91d1d764808076f3814e0e0c59e6323de0c2eede318')

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}

build() {
  mkdir -p build

  cmake \
    -B build -S ${_sourceName} \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DAQUAGPUSPH_USE_MPI:BOOL=ON \
    -DAQUAGPUSPH_USE_VTK:BOOL=ON \
    -DAQUAGPUSPH_CHRONO_EXAMPLES:BOOL=OFF \
    -DBUILD_TESTING=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m644 "${_sourceName}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
