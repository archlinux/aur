# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Contrubutor: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=grig-git
_pkgname=grig
_author=fillods
pkgver=r3.g77ab785
#r3.g77ab785
pkgrel=1
pkgdesc="Ham Radio - Rig control (cat) program"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://groundstation.sourceforge.net/grig/"
license=('GPL')
depends=('hamlib' 'gtk2' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
provides=('grig')
conflicts=('grig')
source=("$_pkgname::git+https://github.com/$_author/$_pkgname.git#branch=master"
	"grig.desktop")
md5sums=('SKIP'
         'e652ce82c1fbf8ead412e978921d8025')
sha256sums=('SKIP'
            '85941679f966eab51a5f90450447cc4b321040978287b7066f8edb1cd0bf537a')

pkgver() {
	cd $_pkgname
#	git describe --long --tags | sed 's/^GRIG.//;s/\([^-]*-g\)/r\1/;s/-/./g'
	git describe --long --tags |\
		sed 's/^GRIG.//;s/\([^-]*-g\)/r\1/;s/-/./;s/^[^-]*\.//;s/-/./g'
}

prepare() {
	cd $srcdir/$_pkgname

	sed -i -e "s:GtkTooltips:GtkTooltip:" src/grig-gtk-workarounds.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-vfo.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-buttons.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-levels.c

	autoreconf -i
}

build(){
	cd $srcdir/$_pkgname

	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$_pkgname

	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 ../$_pkgname.desktop $pkgdir/usr/share/applications

	cd $pkgdir/usr/share/pixmaps/grig
	cp -a $_pkgname-logo.png ../.

	rm -r $pkgdir/usr/share/$_pkgname
}
