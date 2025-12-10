# Maintainer: hyslee <hyslee at hyunsoolee dot net>

_pkgname="modelib2"
pkgname="${_pkgname}-git"
pkgver=2
pkgrel=1
pkgdesc="The Mechanics of Defects Evolution Library 2 (MoDELib2)"
arch=("x86_64" "aarch64")
url="https://github.com/giacomopo/MoDELib2"
_gitname=MoDELib2
options=(!strip) # strip debug symbol
license=('GPL-2.0')
makedepends=("git")

depends=(fftw eigen boost suitesparse pybind11)
source=("git+${url}")
sha256sums=("SKIP")

prepare() {
    cd ${_gitname}
    # Update cmake_minimum_required version in CMakeLists.txt
    sed -i 's/^cmake_minimum_required(VERSION 3\.1\.0)/cmake_minimum_required(VERSION 3.20.0)/' CMakeLists.txt
    # disable DDqt visualizer
    sed -i 's|add_subdirectory.*DDqt.*|# &|' "tools/CMakeLists.txt" || die
}

build() {
  cd ${_gitname}
  cmake -B build --fresh
  cmake --build build -j$(nproc)
}

package() {
    cd ${_gitname}
    install -Dm755 build/tools/DDomp/DDomp "${pkgdir}/usr/bin/DDomp"
    install -Dm755 build/tools/MicrostructureGenerator/microstructureGenerator "${pkgdir}/usr/bin/microstructureGenerator"
    install -Dm644 build/libMoDELib.so "${pkgdir}/usr/lib/libMoDELib.so"
}
