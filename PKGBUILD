# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=dbasic
pkgver=0.92.0
pkgrel=1
pkgdesc="Modern implementation of the original Dartmouth BASIC compilers \
	 in the D programming language"
arch=('x86_64')
url="https://github.com/cpp-tutor/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'liblphobos')
makedepends=('ldc')
optdepends=('clang: for compiling binary')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('02c2e4c7df8b4d7ef12c6c605cf8bc7d2c45e49483938b9a76f6fbb7a54f1ac2')
prepare() {
  cd "$pkgname-$pkgver"
  # fix bison issue
  cp -f autogen/Parser.d .
  touch Parser.d
  echo -e "dbasic 4 < \$1 > run_basic.ll && clang -O3 -Wno-override-module -o run_basic run_basic.ll /usr/share/$pkgname/runtime/basic_lib.c -lm && ./run_basic" > run-linux.sh
  chmod +x run-linux.sh
}

build() {
  cd "$pkgname-$pkgver"
  make -f Makefile.llvm
}


package(){
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 run-linux.sh $pkgdir/usr/share/$pkgname/runtime/run-linux.sh
  install -Dm755 runtime/basic_lib.c $pkgdir/usr/share/$pkgname/runtime/basic_lib.c
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
