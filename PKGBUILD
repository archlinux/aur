# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-sound-git
_pkgname=xdg-sound
pkgver=1.0.r2.g0843795
pkgrel=1
pkgdesc="Command line XDG sound theme utilities"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xdg-sound"
license=('GPL')
groups=('xde-git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('glib2' 'libcanberra')
makedepends=('git' 'pkgconfig')
source=("${pkgname}::git+https://github.com/bbidulock/xdg-sound")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  make -C $pkgname DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
