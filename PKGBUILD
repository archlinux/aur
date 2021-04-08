#  Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Naoya Inada <inaoya@kushinada.org>
#     Updated: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=smlsharp
pkgver=4.0.0
pkgrel=1
pkgdesc="A new programming language in the Standard ML family"
arch=('x86_64')
url="https://smlsharp.github.io/"
license=('MIT')
depends=('gmp'
         'massivethreads=1.00'
         'llvm>=3.9.1')
makedepends=('chrpath')
source=("https://github.com/smlsharp/smlsharp/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        remove-tz-test.patch)
sha256sums=('0b44fb1f369f7cfced197c68f0d3102e940dbe5288adc3bdf618a5a3ec3165db'
            '9ad167dd7582349a84218c1d61347376e439d476cca1ffa26b6addeaf162dc6c')
options=(libtool staticlibs)

# Set this variable to anything non-empty to bootstrap the compiler
_stage=

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make

  if [ -n "${_stage}" ]; then
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
