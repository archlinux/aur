# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=ldcad
pkgver=1.6d2
pkgrel=2
epoch=1
pkgdesc="A multiplatform LDraw (virtual LEGO) editor that lets you edit LDraw model documents in real-time"
arch=('i686' 'x86_64')
url="http://www.melkert.net/LDCad"
license=('custom')
depends=('gtk2' 'glu' 'xdg-utils' 'ttf-dejavu')
backup=('etc/LDCad.cfg')
source=("http://www.melkert.net/action/download/LDCad-${pkgver//./-}-Linux.tar.bz2"
        "license.txt")
sha256sums=('77bdd33f0eea1f3e8d0f2a88dabe0b5b8982a9d66ebbcbcc5ca3d2eba2a5f013'
            '9f94daabad96e05f398e634ab1ed713a1c1326c147825896d8af1b251035e217')


prepare() {
	cd "${srcdir}/LDCad-${pkgver//./-}-Linux"
	# Make the setup script install to the correct paths
	sed -i -e "s:/usr:$pkgdir/usr:" \
		   -e "s:/etc:$pkgdir/etc:" \
		   -e '/update-mime-database/d' \
		   -e '/update-desktop-database/d' setup.sh
    
    if [ "$CARCH" == x86_64 ]; then
	    cp LDCad64 LDCad
    elif [ "$CARCH" == i686 ]; then
	    cp LDCad32 LDCad
    fi
}

package() {
	# Create directories the installer is expecting to find
	cd "${pkgdir}"
	mkdir -p usr/bin
	mkdir -p etc
	mkdir -p usr/share/mime/packages/
	mkdir -p usr/share/applications/
	
	# Run installer
	cd "${srcdir}/LDCad-${pkgver//./-}-Linux"
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
