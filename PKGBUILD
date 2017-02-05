# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Friedrich Weber <fred@reichbier.de>
pkgname=czmq
pkgver=4.0.2
pkgrel=1
pkgdesc="High-level C binding for 0MQ"
arch=('i686' 'x86_64')
url="http://czmq.zeromq.org"
license=('MPL2')
depends=('zeromq>=4.0')
sha1sums=('48a8ee3ab293c501b30cf936e349c5d745a1b5ea')
makedepends=()
source=("https://github.com/zeromq/czmq/archive/v${pkgver}.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -r 's|-Werror=format-security|-Wformat &|' -i Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make CFLAGS=-Wno-error CPPFLAGS=-Wno-error $MAKEFLAGS
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  # From version 4.0.0 binary is called /usr/bin/zmakecert
  # It is no longer moved since it is major version change
  # For compatibility symlink is provided.
  ln -s zmakecert "$pkgdir/usr/bin/makecert.czmq"
}
