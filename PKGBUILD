# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>

pkgname=xbyak
pkgver=7.24.2
pkgrel=1
pkgdesc='A C++ JIT assembler for x86 (IA32), x64 (AMD64, x86-64)'
arch=('any')
url='https://github.com/herumi/xbyak'
license=('BSD')
makedepends=('git' 'cmake')
# tests require multilib repository
#checkdepends=('nasm' 'yasm' 'boost')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('c3cd6fdac08d04ff996a082d51b87c98a46a0c07b17cf1c9e794c4fbb284860e6355c7c4d7b41a66293d8181ec17a18dac772fac384a324b6e7e144540430ac5')

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
