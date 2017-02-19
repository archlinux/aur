# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=xboard-git
pkgver=4.9.1.r8.g7fa90c36
pkgrel=1
pkgdesc="Graphical user interfaces for chess"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/xboard/"
license=('GPL3')
depends=('gnuchess' 'gtk2')
makedepends=('git')
conflicts=('xboard')
provides=('xboard')
#backup=("etc/xboard.conf")
source=("git+http://git.savannah.gnu.org/r/xboard.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}

  # Use gnuchess as default engine
  sed -i 's/fairymax/gnuchess/g' {xaw,gtk}/xboard.h xboard.conf
}

build() {
  cd ${pkgname%-git}

  ./autogen.sh

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --disable-update-mimedb \
    --with-gtk \
    --enable-zippy
  make
}

package() {
  cd ${pkgname%-git}

  make DESTDIR="$pkgdir" install
  install -Dm755 cmail "$pkgdir"/usr/bin/cmail
}
