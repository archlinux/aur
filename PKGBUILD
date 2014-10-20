# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=larswm-git
_pkgname=larswm
pkgver=7.5.3.r17.gefa957c
pkgrel=1
pkgdesc="A tiling window manager based on 9wm"
arch=('i686' 'x86_64')
url="http://porneia.free.fr/larswm/larswm.html"
license=('custom:9wm')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('libxmu')
makedepends=('imake' 'git')
backup=(usr/share/X11/larswm/system.larswmrc)
source=("$pkgname::git+https://github.com/bbidulock/larswm.git"
	"$_pkgname.desktop")
md5sums=('SKIP'
         '528a346582657f7cae09fc89d143e634')
pkgver() {
  cd $pkgname
  printf "7.5.3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $pkgname
  sed -n "/9wm is free/,/nice day/p" README.9wm > LICENSE
  sed -e 's,/etc/X11/larswmrc,/usr/share/X11/larswm/system.larswmrc,' -i dat.h
  sed -e 's,/etc/X11/larswmrc,/usr/share/X11/larswm/system.larswmrc,' -i larswm.man
  xmkmf -a
}
build() {
  cd $pkgname
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install install.man
  install -Dm0644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/xsessions/$_pkgname.desktop"
  install -Dm0644 sample.larswmrc "$pkgdir/usr/share/X11/larswm/system.larswmrc"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=2 et:
