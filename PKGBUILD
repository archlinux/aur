# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Lucas Magalhães <whoisroot@national.shitposting.agency>
pkgname=rocm-clang-ocl
pkgver=6.1.5
pkgrel=1
pkgdesc="OpenCL compilation with clang compiler"
arch=('x86_64')
url="https://github.com/ROCm/clang-ocl"
license=('MIT')
depends=('rocm-core' 'bash' 'rocm-llvm' 'rocm-opencl-runtime')
makedepends=('rocm-cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('3d4911ae53effd17c5978732f95bb1e743ae565209971073d321853ffdd0eb87')
_dirname="$(basename "$url")-$(basename ${source[0]} .tar.gz)"

build() {
  local cmake_args=(
    -Wno-dev
    -B build
    -S "$_dirname"
    -D CMAKE_BUILD_TYPE=None
    -D CLANG_BIN=/opt/rocm/lib/llvm/bin
    -D BITCODE_DIR=/opt/rocm/amdgcn/bitcode
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

check() {
    cmake --build build --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
