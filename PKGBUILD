# Maintainer: Samy Sadi <samy.sadi.contact@gmail.com>
# PKGBUILD based on: Bernhard Landauer <oberon@manjaro.org>
# PKGBUILD based on: Robert Mihaly <robb.mihaly@gmail.com>
# PKGBUILD based on: Gary Ayre <catchfire@gmail.com>
# PKGBUILD based on: Eric Le Bras <eric.lebras@gmail.com>

_printername="ip7200"
_printercode=406
pkgname=("cnijfilter-${_printername}")
pkgver=3.80
pkgrel=1
pkgdesc="Canon ${_printername} series printer driver"
arch=('x86_64')
url='https://en.canon-cna.com/support/consumer_products/products/printers/inkjet/pixma_ip_series/pixma_ip7240.aspx'
license=('GPL2' 'LGPL2' 'custom')
depends=('libglade' 'cups' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common' 'cnijfilter-common-i386' 'canon-pixma-ip7200-printer')
install='cnijfilter.install'
source=('http://gdlp01.c-wss.com/gds/3/0100004693/01/cnijfilter-source-3.80-1.tar.gz' 'all.patch')
sha256sums=('8b6d408f18191f19465ee8fc31aa08455e8bec186fdd3f02ee822f53a9b086a9' '37b91326022d94d3f0dc8a404a8c0550c28267820cabcd7b53b4d2d92c30b1f8')

package() {
	dirs="libs cngpij cngpijmnt cngpijmon ppd pstocanonij backend backendnet cnijfilter lgmon cngpijmon/cnijnpr maintenance"
	
	patch -Np0 -i $srcdir/all.patch || return 1
	
	for dir in $dirs; do
		cd "${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/$dir"
		./autogen.sh --prefix=/usr --program-suffix=${_printername} --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
		make clean
		make || return 1
		make install DESTDIR=${pkgdir} || return 1
	done;
	
	cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}
	install -d ${pkgdir}/usr/lib/bjlib
	install -m 755 ${_printercode}/database/* ${pkgdir}/usr/lib/bjlib
	install -s -m 755 ${_printercode}/libs_bin64/*.so.* ${pkgdir}/usr/lib
	cp -a ${_printercode}/libs_bin64/*.so ${pkgdir}/usr/lib
	install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
	install -d ${pkgdir}/etc/udev/rules.d
	install -m 755 com/etc/81-canonij_prn.rules ${pkgdir}/etc/udev/rules.d/81-canonij_prn.rules
	install -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib/cnnet.ini
	
	ln -s /usr/lib/cups/filter/pstocanonij${_printername} ${pkgdir}/usr/lib/cups/filter/pstocanonij
	chown -R root:root ${pkgdir}/usr/
}

