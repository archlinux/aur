# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=anjuta-extras
pkgver=3.26.0+13+g8248f12
pkgrel=2
pkgdesc="Anjuta Integrated Development Environment extra plugins"
url="http://www.anjuta.org/"
arch=('x86_64')
license=('GPL')
depends=('anjuta')
makedepends=('intltool' 'itstool' git gnome-common)
_commit=8248f1220bedd6afdabb29711714cda725b2c35b  # master
source=("git+https://gitlab.gnome.org/GNOME/anjuta-extras.git#commit=$_commit")
options=('!emptydirs')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^ANJUTA_EXTRA_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
