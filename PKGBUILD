# Maintainer: Your Name <youremail@domain.com>

pkgname=vim-color_coded-git
pkgver=r433.345ec53
pkgrel=1
pkgdesc="A vim plugin for libclang-based highlighting in C, C++, ObjC"
arch=('i686' 'x86_64')
url="https://github.com/jeaye/color_coded"
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'clang' 'llvm')
makedepends=('cmake')
install=vimdoc.install
source=("git+https://github.com/jeaye/color_coded")
sha256sums=('SKIP')

pkgver() {
  cd color_coded
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd color_coded

  sed -i '/CMAKE_INSTALL_PREFIX/d' CMakeLists.txt
  sed -i 's/NAMES LLVM/NAMES LLVM LLVM/' cmake/clang/link.cmake
}

build() {
  cd color_coded
  mkdir build
  cd build

  cmake .. -DCUSTOM_CLANG=1 -DLLVM_ROOT_PATH=/usr -DCMAKE_INSTALL_PREFIX=/usr/share/vim/vimfiles
  make
}

package() {
  cd color_coded

  VIMFILES="$pkgdir"/usr/share/vim/vimfiles
  mkdir -p $VIMFILES
  cp -r {after,autoload,colors,plugin} $VIMFILES

  cd build

  make DESTDIR="$pkgdir/" install
}

