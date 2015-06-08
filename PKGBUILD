# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=biboumi
pkgver=2.0
pkgrel=1
pkgdesc="XMPP gateway to IRC"
arch=('i686' 'x86_64' 'armv7h')
url="http://biboumi.louiz.org/"
license=('ZLIB')
depends=('expat' 'libidn' 'c-ares' 'botan')
makedepends=('cmake')
backup=("etc/$pkgname/$pkgname.cfg")
source=("http://git.louiz.org/biboumi/snapshot/$pkgname-$pkgver.tar.xz")
md5sums=('5aa6f0497abc1a707203314330fbff86')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "../$pkgname-$pkgver"
  make biboumi
}

check() {
  cd "$srcdir/build"
  make test_suite/fast
  ./test_suite
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 unit/biboumi.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 doc/biboumi.1.md "$pkgdir/usr/share/doc/$pkgname/$pkgname.md"
  install -Dm644 conf/biboumi.cfg "$pkgdir/etc/$pkgname/$pkgname.cfg"

  # TODO: generate the manpage.
  #install -Dm644 doc/biboumi.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
