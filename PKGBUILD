# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=muscle
pkgver=5.3
pkgrel=1
pkgdesc="Multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="https://github.com/rcedgar/muscle"
license=('GPL-3.0-or-later')
makedepends=(python)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        https://raw.githubusercontent.com/rcedgar/vcxproj_make/806d016/vcxproj_make.py)
sha256sums=('74b22a94e630b16015c2bd9ae83aa2be2c2048d3e41f560b2d4a954725c81968'
            '902735703004c47705ffa389329378f237fecb154945b489edf6abe260c6694f')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver/src
  python ../../vcxproj_make.py --openmp
  sed -i "/LDFLAGS += -static/s:-static::" Makefile # no static -lgomp
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make -C src
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 bin/muscle "$pkgdir"/usr/bin/muscle
}
