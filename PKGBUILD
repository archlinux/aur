# Maintainer: Andrew Anderson <aanderso@tcd.ie>
pkgname=pantheon-mutter-git
pkgver=3.28
pkgrel=7
pkgdesc='Pantheon Mutter'
arch=(x86_64)
url='http://elementary.io'
license=(GPL)
makedepends=(libinput zenity libxkbfile libxkbcommon-x11 gobject-introspection-runtime)
depends=(intltool gobject-introspection)
provides=(mutter)
conflicts=(mutter)
source=('https://github.com/GNOME/mutter/archive/gnome-3-28.zip')
sha512sums=('7826b54bd50d87e9ab9c2bdea1dc65fbe8ade7c48b9dc4346fa3bb53826f28384116c80a7c4bace4324545fa4dce28989a93a9ab6681256351163e87ada7509f')

prepare() {
  cd "${srcdir}/mutter-gnome-3-28"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/mutter-gnome-3-28"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --libexecdir=/usr/lib --disable-static \
              --disable-schemas-compile --enable-compile-warnings=minimum

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd "${srcdir}/mutter-gnome-3-28"
  make DESTDIR="$pkgdir" install
}
