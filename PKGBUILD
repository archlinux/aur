# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=xbyak
pkgver=6.66
pkgrel=1
pkgdesc='A C++ JIT assembler for x86 (IA32), x64 (AMD64, x86-64)'
arch=('any')
url='https://github.com/herumi/xbyak'
license=('BSD')
makedepends=('git' 'cmake')
# tests require multilib repository
#checkdepends=('nasm' 'yasm' 'boost')
_commit='b5ac7b0f0a71dbb8d1adbbf3c1c0ec88df458531'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

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
