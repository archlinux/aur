# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF

pkgname=grig
pkgver=0.8.0
pkgrel=4
pkgdesc="Rig control (cat) program"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://groundstation.sourceforge.net/grig/"
license=('GPL')
depends=('hamlib' 'gtk2')
source=("http://downloads.sourceforge.net/groundstation/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"g_thread.patch")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/grig-gtk-workarounds.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-vfo.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-buttons.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-levels.c
	patch -p1 -i ${srcdir}/g_thread.patch src/main.c
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

sha256sums=('d621a3400b7720d6671d18bff2e7627cc1442d58df161cc8789851300495d3f3'
            'd216d4bbc8e364a2ed3066659e694204451a7f182a9448df9acb1d8c85808c5c'
            '77a25f821356528a732c08970ca05b9f556564e4517e16304fa14a172040f165')
