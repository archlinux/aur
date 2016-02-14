# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF

pkgname=grig
pkgver=0.8.1
pkgrel=1
pkgdesc="Rig control (cat) program"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://groundstation.sourceforge.net/grig/"
license=('GPL')
depends=('hamlib' 'gtk2' 'intltool')
source=("http://downloads.sourceforge.net/groundstation/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"g_thread.patch")
sha256sums=('be8687418fb23efa0468674c3fdd15340fed06eef09be9de21106cc17e033c25'
            'd216d4bbc8e364a2ed3066659e694204451a7f182a9448df9acb1d8c85808c5c'
            '77a25f821356528a732c08970ca05b9f556564e4517e16304fa14a172040f165')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/grig-gtk-workarounds.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-vfo.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-buttons.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-levels.c
	#patch -p1 -i ${srcdir}/g_thread.patch src/main.c
	LIBS=-lm ./configure --prefix=/usr
	make
}

package() {
	mkdir -p ${pkgdir}/usr/share/applications
	install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	rm -r ${pkgdir}/usr/share/${pkgname}
}

