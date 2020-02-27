# Maintainer: acxz <akashpatel2008 at yahoo dot com>
_pkgname=hcc
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="C++ Compiler for Heterogeneous Compute"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/hcc"
license=('custom:NCSAOSL')
depends=('rocr-runtime')
makedepends=('git' 'cmake' 'rocr-runtime')
provides=('hcc')
conflicts=('hcc')
source=("git+https://github.com/RadeonOpenCompute/hcc.git"
        "git+https://github.com/RadeonOpenCompute/llvm-project.git"
        "git+https://github.com/RadeonOpenCompute/ROCm-Device-Libs.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.llvm-project.git.url "$srcdir/llvm-project"
  git config submodule.ROCm-Device-Libs.git.url "$srcdir/rocdl"
  git submodule update
}

build() {
  mkdir -p "$srcdir/$_pkgname/build"
  cd "$srcdir/$_pkgname/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hcc \
        -DLLVM_INSTALL_UTILS=TRUE \
        ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir" install
}
