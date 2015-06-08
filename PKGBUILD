# Maintainer: Danny Su <contact@dannysu.com>

pkgname=asymmetricfs-git
pkgver=r129.31da328
pkgrel=2
pkgdesc='An Asymmetric, Encrypting Filesystem for Userspace'
arch=('i686' 'x86_64')
url="https://github.com/ckennelly/asymmetricfs"
install=asymmetricfs.install
license=('GPL3')
depends=('fuse' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'clang' 'valgrind')
optdepends=()
source=('git+https://github.com/ckennelly/asymmetricfs.git'
        'git+http://git.chromium.org/external/googletest.git')
sha1sums=('SKIP'
          'SKIP')

_gitname=asymmetricfs

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.googletest $srcdir/thirdparty/googletest
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  export CXX=clang++
  export CC=clang
  mkdir build
  cd build
  cmake .. && cmake --build .
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$_gitname/build/src/asymmetricfs" "$pkgdir/usr/bin/"
}
