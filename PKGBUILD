# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=concord-git
pkgrel=1
pkgver=v3.0.0.r30.g2498dd2e
pkgdesc="A Discord API wrapper library made in C (dev branch)"
arch=('any')
url="https://github.com/Cogmasters/concord"
license=('MIT')
options=('!lto')
depends=('curl')
makedepends=('git')
source=("$pkgname"::git+https://github.com/Cogmasters/concord.git#branch=dev)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  # Patching the Makefile to respect DESTDIR
  sed -i \
    -e 's|$(PREFIX)/include/concord|$(DESTDIR)$(PREFIX)/include/concord|g' \
    -e 's|$(PREFIX)/lib|$(DESTDIR)$(PREFIX)/lib|g' \
    -e 's|$(SHAREDIR)/pkgconfig|$(DESTDIR)$(SHAREDIR)/pkgconfig|g' \
    Makefile

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
