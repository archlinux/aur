# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm-git
_pkgname=adwm
pkgver=0.7.16.r1.gfcfb1ff
pkgrel=2
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/$_pkgname"
license=('GPL')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage' 'libjpeg-turbo' 'libsvg-cairo')
optdepends=('xdg-launch-git: for application launching key bindings'
            'xde-ctools-git: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu-git: for xde-menu root menu default bindings'
            'xde-session-git: for xde-logout and xde-xlock default bindings')
options=('!libtool' '!strip' 'debug')
makedepends=('git' 'perl-timedate')
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
