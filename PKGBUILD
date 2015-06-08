# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=biboumi
pkgname="$_pkgname-git"
pkgver=r386.c649e56
pkgrel=1
pkgdesc="XMPP gateway to IRC"
arch=('i686' 'x86_64' 'armv7h')
url="http://biboumi.louiz.org/"
license=('ZLIB')
depends=('expat' 'libidn' 'c-ares' 'botan')
makedepends=('git' 'cmake')
provides=("$_pkgname=1.99")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.cfg")
source=("$_pkgname::git://git.louiz.org/biboumi")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make biboumi
}

check() {
  cd "$srcdir/$_pkgname/build"
  make test_suite/fast
  ./test_suite
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install

  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 unit/biboumi.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 doc/biboumi.1.md "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.md"
  install -Dm644 conf/biboumi.cfg "$pkgdir/etc/$_pkgname/$_pkgname.cfg"

  # TODO: generate the manpage.
  #install -Dm644 doc/biboumi.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
