#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

_pkgname=libgnome-keyring
pkgname=lib32-$_pkgname
pkgver=3.12.0
pkgrel=2
pkgdesc="GNOME keyring client library"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('lib32-dbus' 'lib32-glib2' 'lib32-libgcrypt' $_pkgname=$pkgver)
makedepends=('gcc-multilib' 'intltool' 'gobject-introspection' 'vala' 'python2')
optdepends=('gnome-keyring: key storage service (or use any other service implementing org.freedesktop.secrets)')
options=('!emptydirs')
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
sha256sums=('c4c178fbb05f72acc484d22ddb0568f7532c409b0a13e06513ff54b91e947783')

build() {
  cd "$_pkgname-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS+=' -m32'

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32/gnome-keyring
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{bin,include,share}
}
