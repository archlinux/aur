# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Lucas Magalhães <whoisroot@national.shitposting.agency>
pkgname=rocm-clang-ocl
pkgver=6.0.2
pkgrel=1
pkgdesc="OpenCL compilation with clang compiler"
arch=('x86_64')
url="https://github.com/ROCm/clang-ocl"
license=('MIT')
depends=('rocm-core' 'bash' 'rocm-llvm' 'rocm-opencl-runtime')
makedepends=('rocm-cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('a2f2fcb203737b1f436b4c2b78bbd696552f6de619ba0e7e8faf95a888869866')
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
