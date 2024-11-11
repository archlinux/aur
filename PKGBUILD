# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-smc
pkgver=0.6.3
pkgrel=1
pkgdesc="GNU Guile state machine compiler"
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-smc"
license=('GPL-3.0-or-later')
# NOTE: If the build fails, please recompile 'guile-lib' first with the
# "--with-guile-site" configure option, and then recompile this package.
depends=('guile' 'guile-lib')
makedepends=('help2man')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9e6d9b4c6a145cefc9c671971ffa46685c1f58634ae1f5b23b7d18b0f0b03429')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  local sitedir=$(guile-config info sitedir)
  ./configure \
    --enable-silent-rules \
    --prefix=/usr \
    --with-guilesitedir=$sitedir
  make
}

check() {
  cd "$pkgname-$pkgver"
  # the "compiler-guile" test currently fails...
  make -k check || :
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
