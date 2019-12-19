pkgname=switcheroo-control-git
_pkgname=switcheroo-control
pkgver=2.0.r3.g4ce4842
pkgrel=1
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=('glib2')
makedepends=('gnome-common')
provides=('switcheroo-control')
conflicts=('switcheroo-control')
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    ;
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/etc/dbus-1" "$pkgdir/usr/share/dbus-1"
  rm -rf "$pkgdir/etc"
}

# vim: ts=2:sw=2:et
