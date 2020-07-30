# Maintainer: Daniel Otero <otero (dot) o (dot) daniel (at) gmail (dot) com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=openmp-nvptx
_pkgname=openmp
pkgver=10.0.1
pkgrel=1
pkgdesc="LLVM OpenMP Runtime Library with NVPTX offloading targets enaled"
arch=('x86_64')
url="https://openmp.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('glibc' 'libelf' 'libffi')
optdepends=('cuda')
makedepends=('cmake' 'ninja' 'clang' 'cuda' 'llvm')
provides=('openmp')
conflicts=('openmp')

_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$_pkgname-$pkgver.src.tar.xz{,.sig})
sha256sums=('d19f728c8e04fb1e94566c8d76aef50ec926cd2f95ef3bf1e0a5de4909b28b44'
            'SKIP')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
	cd "$_pkgname-$pkgver.src"
	mkdir build
}

build() {
	cd "$_pkgname-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCUDA_HOST_COMPILER=/usr/bin/gcc-9 \
    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda \
    -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=35,50,52,53,60,61,62,70,72,75 \
    -DLIBOMPTARGET_ENABLE_DEBUG=ON \
    -DLIBOMP_INSTALL_ALIASES=OFF
  ninja
}

package() {
  cd "$_pkgname-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  rm "$pkgdir/usr/lib/libarcher_static.a"
}

# vim:set ts=2 sw=2 et:
