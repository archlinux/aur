# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>

pkgname=xbyak
pkgver=7.24.1
pkgrel=1
pkgdesc='A C++ JIT assembler for x86 (IA32), x64 (AMD64, x86-64)'
arch=('any')
url='https://github.com/herumi/xbyak'
license=('BSD')
makedepends=('git' 'cmake')
# tests require multilib repository
#checkdepends=('nasm' 'yasm' 'boost')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('cb9d78372f0b6d8a8076309e3c8f22c18e0e6ed62d8403e3eeb2e4ec1093693da3eddce0508f6d710864789bbdd991370a64b9809a41efea11136f97245a7137')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev

  cmake --build build
}

#check() {
#  cd "$pkgname"
#
#  make test
#
#  make -C sample CXXFLAGS+="-DXBYAK_NO_EXCEPTION"
#}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" readme.{md,txt}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
