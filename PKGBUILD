# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=xbyak
pkgver=6.68
pkgrel=1
pkgdesc='A C++ JIT assembler for x86 (IA32), x64 (AMD64, x86-64)'
arch=('any')
url='https://github.com/herumi/xbyak'
license=('BSD')
makedepends=('git' 'cmake')
# tests require multilib repository
#checkdepends=('nasm' 'yasm' 'boost')
_commit='a1ac3750f9a639b5a6c6d6c7da4259b8d6790989'
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
