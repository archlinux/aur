# Maintainer: Stan Ionascu <s@stashed.xyz>

pkgname=rocwmma-gfx1103
pkgver=6.4.1
pkgrel=1
pkgdesc='Library for accelerating mixed precision matrix multiplication'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocWMMA/en/latest/'
license=('MIT')
depends=('rocm-core' 'hip-runtime-amd' 'rocblas' 'openmp')
makedepends=('rocm-cmake' 'doxygen')
provides=(rocwmma)
conflicts=(rocwmma)
_git='https://github.com/ROCmSoftwarePlatform/rocWMMA'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "0001-add-support-for-gfx1103-phoenix.patch")
sha256sums=('888e9794adff06ca1be811d80018e761b9a9cf84cb88dec9e51bc3a6db7a359a'
            '2b9e57a2b96e4f653b8660b5f7b14605a72705e745787682517bbd1ef6bfdbc5')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd rocWMMA-rocm-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/0001-add-support-for-gfx1103-phoenix.patch"
}

build() {
    local cmake_args=(
        -Wno-dev
        -B build
        -S "$_dirname"
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
        -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
        -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
        -D CMAKE_INSTALL_PREFIX=/opt/rocm
        -D CMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
        -D ROCWMMA_BUILD_TESTS=OFF
        -D ROCWMMA_BUILD_SAMPLES=OFF
    )
    cmake "${cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
