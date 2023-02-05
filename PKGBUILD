# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Lucas Magalhães <whoisroot@national.shitposting.agency>
pkgname=rocm-clang-ocl
pkgver=5.4.2
pkgrel=2
pkgdesc="OpenCL compilation with clang compiler"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/clang-ocl"
license=('MIT')
depends=('rocm-llvm' 'rocm-opencl-runtime')
makedepends=('rocm-cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('d11a1b4c2097a17fa62142c2c5e45b688a7f1da446c7534c41b6bb40519048c2')
_dirname="$(basename "$url")-$(basename ${source[0]} .tar.gz)"

build() {
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCLANG_BIN=/opt/rocm/llvm/bin \
    -DBITCODE_DIR=/opt/rocm/amdgcn/bitcode \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm
  cmake --build build
}

check() {
    cmake --build build --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
