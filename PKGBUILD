# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=cmark
pkgver=0.22.0
pkgrel=1
pkgdesc="CommonMark parsing and rendering library and program in C"
arch=('i686' 'x86_64')
url="https://github.com/jgm/cmark"
license=('custom:BSD2')
depends=('glibc')
makedepends=('cmake' 'python')
source=("https://github.com/jgm/cmark/archive/${pkgver}.tar.gz#/${pkgname}-${pkgver}.tar.gz"
        'fix-tests-with-python-35.patch'
        'fix-tests-with-python-35-2.patch')
sha256sums=('a45956e6ee491d71e9271ddeb09364599a136b8956d219f0168dd6042f6f791b'
            'a6ba12a098011b05e2f55b9b5ea1124e1e93df6bc9bf6b2141b0e07d2dd1d7de'
            '1a80ab1eb4921430ecee9d02e5c40eb24d6fe7adbd764c1490d18a52f275af11')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i ../fix-tests-with-python-35.patch
  patch -p1 -i ../fix-tests-with-python-35-2.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build/
  cd build/
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build/"

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/"

  make install DESTDIR="$pkgdir/"
  install -D -m 644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
