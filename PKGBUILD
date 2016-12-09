# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=ldcad
pkgver=1.5
pkgrel=2
pkgdesc="A multiplatform LDraw (virtual LEGO) editor that lets you edit LDraw model documents in real-time"
arch=('i686' 'x86_64')
url="http://www.melkert.net/LDCad"
license=('custom')
depends=('gtk2' 'glu' 'xdg-utils')
backup=('etc/LDCad.cfg')
source_i686=("http://www.melkert.net/action/download/LDCad-${pkgver//./-}-Linux-32.tar.bz2")
source_x86_64=("http://www.melkert.net/action/download/LDCad-${pkgver//./-}-Linux-64.tar.bz2")
source=('license.txt')
md5sums=('9917fda1740c892e0e7d240fb4fd8812')
md5sums_i686=('9855dab2af49cb68405fd254c44f2b96')
md5sums_x86_64=('9448e18efe67da91fba0e424c18aa726')

if [ "$CARCH" == x86_64 ]; then
	_srcname=LDCad-${pkgver//./-}-Linux-64/
elif [ "$CARCH" == i686 ]; then
	_srcname=LDCad-${pkgver//./-}-Linux-32/
fi

prepare() {
	cd "${srcdir}/${_srcname}"
	# Make the setup script install to the correct paths
	sed -i -e "s:/usr:$pkgdir/usr:" \
		   -e "s:/etc:$pkgdir/etc:" \
		   -e '/update-mime-database/d' \
		   -e '/update-desktop-database/d' setup.sh
}

package() {
	# Create directories the installer is expecting to find
	cd "${pkgdir}"
	mkdir -p usr/bin
	mkdir -p etc
	mkdir -p usr/share/mime/packages/
	mkdir -p usr/share/applications/
	
	# Run installer
	cd "${srcdir}/${_srcname}"
	./setup.sh
	
	# Move mime file so it doesn't conflict with other packages
	mv "${pkgdir}/usr/share/mime/packages/ldraw.xml" "${pkgdir}/usr/share/mime/packages/ldcad.xml"
	
	# Remove references to $pkgdir in config and desktop file
	sed -i -e "s:$pkgdir::" \
		"${pkgdir}/etc/LDCad.cfg" \
		"${pkgdir}/usr/share/applications/LDCad.desktop"
		
	# Install license
	install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
