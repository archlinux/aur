# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software

pkgname=cewe-fotobuch
pkgver=6.1.3
pkgrel=2
pkgdesc="an offline client for creating photobooks, uploading and ordering them at cewe.de"
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.de/download/Data/16523/hps/setup_Mein_CEWE_FOTOBUCH.tgz" 
"cewe-fotobuch.desktop")
install=cewe-fotobuch.install
md5sums=('9197c2551c471da202de3f0652eba324'
         'ebc303204c0aecab97ecd53627f7eb7d')

_installDir=/usr/share/$pkgname

package() {
	# put icons and mimetype in the right place
	export XDG_UTILS_INSTALL_MODE=system
	export XDG_DATA_DIRS="$pkgdir/usr/share:"

	_installDir=$pkgdir$_installDir
	mkdir -p $_installDir $pkgdir/usr/{bin,share/icons/hicolor,share/mime/packages}

	cd $srcdir
	# don't install broken desktop file or put it on current user's desktop
	sed -i 's/createDesktopShortcuts();/#createDesktopShortcuts();/' ./install.pl

	./install.pl --installDir=$_installDir --workingDir=$srcdir -k -v

	# remove unneeded mime cache files (leave directories)
	rm $pkgdir/usr/share/mime/* &> /dev/null || true

#	# copy EULA
#	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt || return 1

        # create startup script
	cat > $pkgdir/usr/bin/cewe-fotobuch <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		./cewe-fotobuch "\$@"
	EOF
        chmod 755 $pkgdir/usr/bin/cewe-fotobuch

        # utf-8 and space in executable filenames is generally a bad idea
	cd $_installDir
        mv "Mein CEWE FOTOBUCH" "cewe-fotobuch"
	# create desktop shortcut
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/cewe-fotobuch.xpm && \
	install -D -m644 $srcdir/cewe-fotobuch.desktop $pkgdir/usr/share/applications/cewe-fotobuch.desktop
}
