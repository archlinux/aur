#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.12.0+11+g3766bcc
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('dbus' 'glib2' 'libgcrypt')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2' git gnome-common)
optdepends=('gnome-keyring: key storage service (or use any other service implementing org.freedesktop.secrets)')
options=('!emptydirs')
url="https://www.gnome.org"
_commit=3766bcc482f9e02fb5f9c183e814833ad1fbf08a  # master
source=("git+https://gitlab.gnome.org/GNOME/libgnome-keyring.git#commit=$_commit")
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
  cd "$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
