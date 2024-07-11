# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=mimetic
pkgver=0.9.8
pkgrel=3
pkgdesc='A free, MIT licensed, Email library (MIME) written in C++'
url="http://www.codesink.org/mimetic_mime_library.html"
arch=(x86_64)
license=(MIT)
depends=(gcc-libs)
source=(http://www.codesink.org/download/$pkgname-$pkgver.tar.gz
        https://github.com/tat/mimetic/commit/bf84940f.patch)
sha256sums=('3a07d68d125f5e132949b078c7275d5eb0078dd649079bd510dd12b969096700'
            '877406aff5b11042df9e036ed9e58dcc3e2ce54b47f263fd31886a9c16d7a0ea')

prepare() {
  patch -d $pkgname-$pkgver -p1 < bf84940f.patch # Fix build
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
