# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+17+gca04c23
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=(x86_64)
url="https://git.gnome.org/browse/seahorse-nautilus/"
license=(GPL)
depends=(libcryptui gcr nautilus)
makedepends=(intltool gnome-common git libgnome-keyring)
_commit=ca04c239f00cce931ccb8680bba528507a154368  # master
source=("git+https://git.gnome.org/browse/seahorse-nautilus#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
