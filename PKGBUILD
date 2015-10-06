# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on rtorrent [community]
# Maintainer: aksr <aksr at t-com dot me>
pkgname=rtorrent-git
pkgver=0.9.4.r91.g62cb5a4
pkgrel=1
pkgdesc="A ncurses BitTorrent client written in C++, based on the libTorrent libraries for Unix."
url="https://github.com/rakshasa/rtorrent/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl' 'libtorrent-git' 'xmlrpc-c')
makedepends=('git' 'cppunit')
conflicts=('rtorrent')
provides=('rtorrent')
install=${pkgname}.install
source=("$pkgname::git+https://github.com/rakshasa/rtorrent.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  export CXXFLAGS="${CXXFLAGS} -std=c++11 -fno-strict-aliasing"
  ./configure --prefix=/usr --enable-debug --with-xmlrpc-c
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 doc/faq.xml "$pkgdir/usr/share/doc/rtorrent/faq.xml"
  install -Dm644 doc/old/rtorrent.1 "$pkgdir/usr/share/man/man1/rtorrent.1"
  install -Dm644 doc/rtorrent.rc "$pkgdir/usr/share/doc/rtorrent/rtorrent.rc"
}

