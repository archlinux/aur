# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=vimpc-git
pkgver=0.09.2.r16.g95ad78d
pkgrel=1
pkgdesc='Vi/vim inspired client for Music Player Daemon (MPD)'
arch=(x86_64)
url=https://github.com/boysetsfrog/vimpc
license=(GPL-3.0-or-later)
#makedepends=(git)
makedepends=(boost git pcre)
depends=(libmpdclient taglib)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  ./autogen.sh

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 $pkgname/doc/vimpcrc.example -t "$pkgdir/usr/share/doc/vimpc"
  make -C $pkgname DESTDIR="$pkgdir/" install
}

