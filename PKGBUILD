# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session
pkgver=1.14
pkgrel=1
pkgdesc="X Desktop Environment Display and Session Management"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
depends=('perl' 'm4' 'libunique' 'libxvnc' 'xde-theme' 'xde-ctools'
	 'xde-helpers' 'xde-menu' 'xdg-launch' 'numlockx')
makedepends=('xorgproto')
optdepends=('xorg-xdm-xlogin: to use xde-xlogin and xde-xchooser')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('6950f8afc9747f9c84daf74eb305c67e226a5511c21f65d0d18ba6aa71ed77d9')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
