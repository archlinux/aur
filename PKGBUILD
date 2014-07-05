# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=uwm-git
pkgver=0.30.10
pkgrel=6
pkgdesc="Micro (u) Window Manager"
arch=('i686' 'x86_64')
url="http://uwm.sourceforge.net/"
license=('AGPL3')
provides=('uwm')
conflicts=('uwm')
backup=(usr/share/X11/uwm/system.uwmrc)
depends=('xcb-util-renderutil' 'xcb-util-image' 'xcb-util-keysyms' 'bash' 'libpng' 'libjpeg' 'xcb-util-wm')
makedepends=('git')
source=("$pkgname::git://git.code.sf.net/p/uwm/code"
        "uwm.desktop")
md5sums=('SKIP'
         'a16c73faeab8c1fc3c74f3320776789a')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's,^[^0-9]*,,;s,-,.,g;s,\.g[a-f0-9]*$,,'
}

prepare() {
  cd $pkgname
  sed 's,/usr/local/etc/system.uwmrc,/usr/share/X11/uwm/system.uwmrc,' -i uwm.h
  sed 's,/usr/local/etc/system.uwmrc,/usr/share/X11/uwm/system.uwmrc,' -i uwmrc.5
  sed 's,/etc/system.uwmrc /usr/local/etc/system.uwmrc,/usr/share/X11/uwm/system.uwmrc,' -i uwm.1
}

build() {
  cd $pkgname
  make
  make contrib/uwm-helper
}

package() {
  cd $pkgname
  install -Dm0755 uwm "$pkgdir/usr/bin/uwm"
  install -Dm0755 contrib/uwm-helper "$pkgdir/usr/bin/uwm-helper"
  install -Dm0644 uwm.1 "$pkgdir/usr/share/man/man1/uwm.1"
  install -Dm0644 uwmrc.5 "$pkgdir/usr/share/man/man5/uwmrc.5"
  install -Dm0644 contrib/uwmrc.example "$pkgdir/usr/share/X11/uwm/system.uwmrc"
  install -Dm0644 contrib/uwm16x16.xpm "$pkgdir/usr/share/pixmaps/uwm16x16.xpm"
  cd "$srcdir"
  install -Dm0644 uwm.desktop "$pkgdir/usr/share/xsessions/uwm.desktop"
}


# vim: set sw=2 et:
