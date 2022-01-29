# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets-git
_pkgname=xde-applets
pkgver=0.12.r1.g04da217
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/$_pkgname"
license=('GPL')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors')
makedepends=('dbus-glib' 'libunique' 'xorgproto' 'git' 'libpackagekit-glib' 'cpupower' 'upower' 'gdk-pixbuf-xlib')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("$pkgname::git+https://github.com/bbidulock/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
}
