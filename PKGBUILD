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
	# don't put broken desktop file on current user's desktop; don't burble and dish out wrong information
	sed -i 's/createDesktopShortcuts();/#createDesktopShortcuts();/;
		s/^printf(\$TRANSLATABLE\[\(12\|4\)\],/print("\\n");#/' ./install.pl

	# don't show EULA/ask for confirmation if cewe-fotobuch is already installed
	which cewe-fotobuch &>/dev/null && update='--update'

	./install.pl $update --installDir=$_installDir -k -v
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt

        # create startup script
	cat > $pkgdir/usr/bin/cewe-fotobuch <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		KDEHOME=\$HOME/.kde4 exec ./cewe-fotobuch "\$@"
	EOF
        chmod 755 $pkgdir/usr/bin/cewe-fotobuch

        # utf-8 and space in executable filenames is generally a bad idea
	cd $_installDir
        mv "Mein CEWE FOTOBUCH" "cewe-fotobuch"
	# create desktop shortcut
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/cewe-fotobuch.xpm && \
	install -D -m644 $srcdir/cewe-fotobuch.desktop $pkgdir/usr/share/applications/cewe-fotobuch.desktop

	# adjust product name in mimetype comment
	sed -i 's/Mein CEWE FOTOBUCH/CeWe Fotobuch/' $pkgdir/usr/share/mime/packages/*
	# remove unneeded mime cache files and installation logs
	rm -d $pkgdir/usr/share/mime/application/* $pkgdir/usr/share/mime/* \
		$_installDir/.log/* $_installDir/.log &> /dev/null || true
}
