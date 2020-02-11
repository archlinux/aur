# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets-git
pkgver=0.8.r2.g8652c89
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-applets"
license=('GPL')
provides=('xde-applets')
conflicts=('xde-applets')
depends=('libsm' 'libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors'
		'libpackagekit-glib' 'cpupower' 'upower')
makedepends=('dbus-glib' 'libunique' 'xorgproto' 'git')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("$pkgname::git+https://github.com/bbidulock/xde-applets.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
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
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
