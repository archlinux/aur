# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software

pkgname=cewe-fotobuch
pkgver=6.1.3
pkgrel=3
pkgdesc="an offline client for creating photobooks, uploading and ordering them at cewe.de"
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.de/download/Data/16523/hps/setup_Mein_CEWE_FOTOBUCH.tgz"
	'updater.pl')
install=cewe-fotobuch.install
md5sums=('9197c2551c471da202de3f0652eba324'
         '4df55a80124dc8555edf799bd566c5de')

_installDir=/usr/share/$pkgname
_productRename='CEWE Fotobuch'

pkgver() {
	grep 'my $HPS_VER' $srcdir/install.pl | grep -Po '[\d\.]+'
}

package() {
	# put icons and mimetype in the right place
	export XDG_UTILS_INSTALL_MODE=system
	export XDG_DATA_DIRS="$pkgdir/usr/share:"

	_installDir=$pkgdir$_installDir
	mkdir -p $_installDir $pkgdir/usr/{bin,share/icons/hicolor,share/mime/packages,share/applications}

	cd $srcdir
	# don't clear screen, install broken desktop file, or burble
	sed -i 's/^\(system("clear"\|createDesktopShortcuts(\|printf(\$TRANSLATABLE\).*;//' install.pl

	# don't show EULA/ask for confirmation if cewe-fotobuch is already installed
	which cewe-fotobuch &>/dev/null && update='--update'
	# keep packages unless updating from within application
	[[ -z "$_UPDATING" ]] && keepPackages='-k' || update='--upgrade'

	./install.pl $update $keepPackages --installDir=$_installDir -v
	install -m644 -b updater.pl $_installDir/updater.pl
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt
        # pixmap for legacy customised mimetypes
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/cewe-fotobuch.xpm

	# create startup script and desktop file
	cat > $pkgdir/usr/bin/cewe-fotobuch <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		KDEHOME=\$HOME/.kde4 exec ./cewe-fotobuch "\$@"
	EOF
	cat > $pkgdir/usr/share/applications/cewe-fotobuch.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=$_productRename
		Comment=Offline client for cewe.de service
		Exec=cewe-fotobuch
		Icon=hps-16523
		StartupNotify=true
		Categories=Graphics;Photography;
		MimeType=application/x-hps-mcf
	EOF
	chmod 755 $pkgdir/usr/bin/cewe-fotobuch $pkgdir/usr/share/applications/cewe-fotobuch.desktop

        # utf-8 and space in executable filenames is generally a bad idea
	cd $_installDir
        mv "Mein CEWE FOTOBUCH" "cewe-fotobuch"

	# adjust product name in mimetype comment
	sed -i "s/Mein CEWE FOTOBUCH/$_productRename/" $pkgdir/usr/share/mime/packages/*
	# remove unneeded mime cache files and installation logs
	rm -d $pkgdir/usr/share/mime/application/* $pkgdir/usr/share/mime/* \
		$_installDir/.log/* $_installDir/.log &> /dev/null || true
	echo
}
