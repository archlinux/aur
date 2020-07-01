#  Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Naoya Inada <inaoya@kushinada.org>
#     Updated: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=smlsharp
pkgver=3.6.0
pkgrel=1
pkgdesc="A new programming language in the Standard ML family"
arch=('x86_64')
url="http://www.pllab.riec.tohoku.ac.jp/smlsharp/"
license=('custom')
depends=('gmp'
         'yajl>=2.1.0'
         'massivethreads=1.00'
         'llvm>=3.9.1')
makedepends=('chrpath')
source=("http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/$pkgname-$pkgver.tar.gz"
        remove-tz-test.patch)
sha256sums=('83790d5e6b468a08f7fb221f0c2682f4243aaff063c4c43533734e4232e7720b'
            '9ad167dd7582349a84218c1d61347376e439d476cca1ffa26b6addeaf162dc6c')
options=(libtool staticlibs)

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
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
