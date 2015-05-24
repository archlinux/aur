# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-gtk2-git
pkgver=2.8.1.4
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator (GTK2 version)"
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme')
makedepends=('git' 'docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
provides=('roxterm')
conflicts=('roxterm' 'roxterm-git' 'roxterm-gtk2')
install=roxterm-gtk2-git.install

source=("git://roxterm.git.sourceforge.net/gitroot/roxterm/roxterm")
md5sums=('SKIP')

_gitname="roxterm"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd "$srcdir/$_gitname"
  python2 mscript.py configure --prefix=/usr --no-lock --disable-gtk3
  python2 mscript.py build --no-lock
}

package() {
  cd "$srcdir/$_gitname"
  python2 mscript.py install DESTDIR="$pkgdir/" --no-lock
  for s in 16 20 32 48 64; do
    install -d "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps"
    rsvg-convert -a -w $s -h $s -f png \
       "$pkgdir/usr/share/icons/hicolor/scalable/apps/roxterm.svg" \
      >"$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/roxterm.png"
  done
} 
