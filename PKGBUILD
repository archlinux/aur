# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=vimpc-git
pkgver=0.09.2.r8.gc518610
pkgrel=2
pkgdesc="Vi/vim inspired client for Music Player Daemon (MPD)"
arch=('x86_64')
url="https://github.com/boysetsfrog/vimpc"
license=('GPL3')
#makedepends=('git')
makedepends=('boost' 'git')
depends=('libmpdclient' 'taglib')
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
  cd $pkgname
  install -Dm644 doc/vimpcrc.example -t "$pkgdir/usr/share/doc/vimpc"
  make DESTDIR="$pkgdir/" install
}

