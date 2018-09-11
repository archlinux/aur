#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.12.0
pkgrel=3
pkgdesc="GNOME keyring client library"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('dbus' 'glib2' 'libgcrypt')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2')
optdepends=('gnome-keyring: key storage service (or use any other service implementing org.freedesktop.secrets)')
options=('!emptydirs')
url="https://www.gnome.org"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('c4c178fbb05f72acc484d22ddb0568f7532c409b0a13e06513ff54b91e947783')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
