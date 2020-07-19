# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=llvm-amdgpu-git
pkgdesc='Radeon Open Compute - LLVM toolchain (llvm, clang, lld)'
pkgver=latest
pkgrel=1
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/llvm-project'
license=('custom:Apache 2.0 with LLVM Exception')
depends=(z3)
makedepends=(git cmake python)
source=("${pkgname}::git+$url")
sha256sums=('SKIP')
provides=('llvm-amdgpu')
conflicts=('llvm-amdgpu')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

    cmake -DCMAKE_INSTALL_PREFIX='/opt/rocm/llvm' \
          -DCMAKE_BUILD_TYPE=Release \
          -DLLVM_HOST_TRIPLE=$CHOST \
          -DLLVM_BUILD_UTILS=ON \
          -DLLVM_ENABLE_BINDINGS=OFF \
          -DLLVM_ENABLE_OCAMLDOC=OFF \
          -DLLVM_ENABLE_PROJECTS='llvm;clang;lld' \
          -DLLVM_TARGETS_TO_BUILD='AMDGPU;X86' \
          -DOCAMLFIND=NO \
          "$pkgname/llvm"
    MAKEFLAGS="$MAKEFLAGS -j$THREADS" make
}

package() {
    DESTDIR="$pkgdir" make install
}
