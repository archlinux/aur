# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets
pkgver=0.12
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/$pkgname"
license=('GPL')
depends=('libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors')
makedepends=('dbus-glib' 'libunique' 'xorgproto' 'libpackagekit-glib' 'cpupower' 'upower' 'gdk-pixbuf-xlib')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('91de2f4a40efc306866515e316a80525')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
