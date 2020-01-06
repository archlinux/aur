pkgname=switcheroo-control
pkgver=2.1
pkgrel=1
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=(glib2)
makedepends=(gnome-common)
_commit=09039f979878443e55ce5336883a047680471f3f
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    ;
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/etc/dbus-1" "$pkgdir/usr/share/dbus-1"
  rm -rf "$pkgdir/etc"
}

# vim: ts=2:sw=2:et
