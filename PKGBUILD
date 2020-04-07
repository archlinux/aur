# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=llvm-roc
pkgdesc='Radeon Open Compute - LLVM toolchain (clang, lld)'
pkgver=3.3.0
pkgrel=1
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/llvm-project'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake python)
source=("https://github.com/RadeonOpenCompute/llvm-project/archive/rocm-ocl-$pkgver.tar.gz")
#        "llvm-roc-3.0.0-add_libraries.patch")

sha256sums=('a2bef7042e8e2f2cd8548cb246b88322e1c77188839983dcac8312d56f544dc8')
#            'e37b026d5026381940a6300407551c9eba1c25a0f0f0c650d351295e692776f7')

prepare() {
    cd "$srcdir/llvm-project-rocm-ocl-$pkgver"

    local src
}

build() {
    # building LLVM/Clang requires ~1.5G per unit
    THREADS=$(( ($(getconf _PHYS_PAGES) * $(getconf PAGESIZE)) / 1610612736 ))
    if [ "$THREADS" -lt 1 ]; then
        THREADS=1
    fi
    NPROC=$(nproc)
    if [ "$THREADS" -gt $(nproc) ]; then
        THREADS="$NPROC"
    fi

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/opt/rocm' \
        -DLLVM_ENABLE_BINDINGS=OFF \
        -DLLVM_ENABLE_OCAMLDOC=OFF \
        -DLLVM_ENABLE_PROJECTS='clang;lld' \
        -DLLVM_TARGETS_TO_BUILD='AMDGPU' \
        -DOCAMLFIND=NO \
        "$srcdir/llvm-project-rocm-ocl-$pkgver/llvm"
    MAKEFLAGS="$MAKEFLAGS -j$THREADS" make
}

package() {
    DESTDIR="$pkgdir/" make -C "$srcdir" install
}
