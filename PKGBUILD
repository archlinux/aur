# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch-git
_pkgname=xdg-launch
pkgver=1.12.r1.g26f7127
pkgrel=2
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/$_pkgname"
license=('GPL')
groups=('xde-git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('glib2' 'libxrandr' 'libxinerama')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('git' 'pkgconfig')
source=("$pkgname::git+https://github.com/bbidulock/$_pkgname")
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
  ./configure
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
