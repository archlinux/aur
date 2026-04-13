# Maintainer: GooseStation contributors

pkgname=cpuinfo-pytorch-git
pkgver=r838.7607ca5
pkgrel=1
pkgdesc='CPU INFOrmation library (x86/x86-64/ARM/ARM64, PyTorch/cpuinfo)'
arch=('x86_64' 'aarch64')
url='https://github.com/pytorch/cpuinfo'
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('cpuinfo-pytorch')
conflicts=('cpuinfo-pytorch')
source=("git+https://github.com/pytorch/cpuinfo.git")
sha256sums=('SKIP')

pkgver() {
  cd cpuinfo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S cpuinfo -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPUINFO_LIBRARY_TYPE=shared \
    -DCPUINFO_BUILD_TOOLS=OFF \
    -DCPUINFO_BUILD_UNIT_TESTS=OFF \
    -DCPUINFO_BUILD_MOCK_TESTS=OFF \
    -DCPUINFO_BUILD_BENCHMARKS=OFF \
    -DCPUINFO_BUILD_PKG_CONFIG=ON \
    -Wno-dev

  cmake --build build --parallel
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 cpuinfo/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
