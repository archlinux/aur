# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session
pkgver=1.13
pkgrel=1
pkgdesc="X Desktop Environment Display and Session Management"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
depends=('m4' 'pam' 'libunique' 'libxvnc' 'xde-theme' 'xde-ctools'
	 'xde-helpers' 'xde-menu' 'xdg-launch' 'numlockx')
makedepends=('xorgproto')
optdepends=('xorg-xdm-xlogin-git: to use xde-xlogin and xde-xchooser')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('aebf15df485ee78836aec7c31b19428aad020dc82d864347c06b7387ddfb9c8a')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
