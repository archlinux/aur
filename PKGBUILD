# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.7.17
pkgrel=1
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/$pkgname"
license=('GPL')
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage' 'libjpeg-turbo' 'libsvg-cairo')
optdepends=('xdg-launch: for application launching key bindings'
            'xde-ctools: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu: for xde-menu root menu default bindings'
            'xde-session: for xde-logout and xde-xlock default bindings')
options=('!libtool')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz"
        gcc15.patch)
sha512sums=('225a854f014772bd08f471a17c66c6b36beaade5706cf25a7f372acbf01903ae60a3e8d250c64471355773fbf2843a881406f798fd56650ba671c1c5834a3144'
            '81a687ec2264903caceff3b7830ab820c433d9d42391f7a08312e1bd2927f0971a03ee1217ba5cea7ea73c68cb95ddc502a10ecca3eb81f95e6c99d1909586f4')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 <../gcc15.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
