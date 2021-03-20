#  Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Naoya Inada <inaoya@kushinada.org>
#     Updated: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=smlsharp
pkgver=3.7.1
pkgrel=1
pkgdesc="A new programming language in the Standard ML family"
arch=('x86_64')
url="http://www.pllab.riec.tohoku.ac.jp/smlsharp/"
license=('custom')
depends=('gmp'
         'massivethreads=1.00'
         'llvm>=3.9.1')
makedepends=('chrpath')
source=("http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/$pkgname-$pkgver.tar.gz"
        remove-tz-test.patch)
sha256sums=('6dbe0c6c11b6636f9cf5696961782fd43490ea63265d6e19bf387764931f4449'
            '9ad167dd7582349a84218c1d61347376e439d476cca1ffa26b6addeaf162dc6c')
options=(libtool staticlibs)

# Set this variable to anything non-empty to bootstrap the compiler
stage=

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make

  if [ -n "$stage" ]; then
    make stage
    make
  fi
}

check() {
  cd $srcdir/$pkgname-$pkgver

  # Remove a Date test that only succeeds if in JST
  patch -Np0 -i ../remove-tz-test.patch

  make test
}

package(){  
  cd $srcdir/$pkgname-$pkgver
  chrpath -d src/compiler/smlsharp
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 src/smlnj/LICENSE $pkgdir/usr/share/licenses/$pkgname/SMLNJ_LICENSE
}
