# Maintainer: Tomasz Żok <tomasz.zok[at]gmail.com>
pkgname=modules
pkgver=3.2.10
pkgrel=1
pkgdesc="The Environment Modules package provides for the dynamic modification of a user's environment via modulefiles"
arch=('i686' 'x86_64')
url="http://modules.sourceforge.net/"
license=('GPLv2')
depends=('tcl>=8')
makedepends=(dejagnu)
install=modules.install
source=(http://sourceforge.net/projects/modules/files/Modules/modules-3.2.10/$pkgname-$pkgver.tar.bz2)
md5sums=('7db43a0e272574219d68bd2a2683f25f')

# just number, no letter in the end
_pkgver=${pkgver%[a-z]}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  ./configure --prefix=/usr/local --mandir=/usr/share/man
  make CFLAGS="-DUSE_INTERP_ERRORLINE $CFLAGS"
}

check() {
  cd "$srcdir/$pkgname-$_pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install

  ln -sf $_pkgver "$pkgdir/usr/local/Modules/default"
  
  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  install "$pkgdir/usr/local/Modules/default/init/bash" "$_profiled/modules.sh"
  install "$pkgdir/usr/local/Modules/default/init/csh" "$_profiled/modules.csh"
}

# vim:set ts=2 sw=2 et:
