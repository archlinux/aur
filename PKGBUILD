# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=gnome-system-monitor-gtk2
pkgver=2.28.2
pkgrel=3
pkgdesc="A system monitor for GNOME (GTK2 version)"
arch=('i686' 'x86_64')
url='https://help.gnome.org/users/gnome-system-monitor/'
license=('GPL')
depends=('libwnck' 'libgtop' 'gtkmm' 'librsvg' 'gnome-icon-theme' 'gconf')
makedepends=('pkg-config' 'gnome-doc-utils' 'intltool')
provides=('gnome-system-monitor')
conflicts=('gnome-system-monitor')
install=gnome-system-monitor.install
source=("ftp://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.bz2")
md5sums=('3f0bca9b0ebc7a365466851cd580d167')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # glib fixes
  find ./src -type f -exec sed -i 's/#include <glib\/gtypes.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gmacros.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gstring.*>/#include <glib.h>/g' {} \;
  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lgthread-2.0"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
