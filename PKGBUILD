# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=gnome-system-monitor-gtk2
pkgver=2.28.2
pkgrel=5
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
sha256sums=('b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9d62a9784e5ae59')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # glib fixes
  find ./src -type f -exec sed -i 's/#include <glib\/gtypes.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gmacros.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gstring.*>/#include <glib.h>/g' {} \;
  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lgthread-2.0"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-scrollkeeper CXXFLAGS='-g -O2 -std=c++11'
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
