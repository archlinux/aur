# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software

_keyaccount=16523
_productUrname='Mein CEWE FOTOBUCH'
_productRename='CEWE Fotobuch'
_lang='de_DE'

pkgname=cewe-fotobuch
conflicts=(cewe-fotoservice)
pkgdesc='an offline client for creating photobooks, uploading and ordering them at cewe.de'
md5sums=('f0bbeb285f9818e8c763265da2fe2e88'
# template start; name=cewe; version=6.4.1;
         '11e395d7c48d7f340435eeb938bcb502')

pkgver=6.4.1
pkgrel=2
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("https://dls.photoprintit.com/download/Data/$_keyaccount-$_lang/hps/setup_${_productUrname// /_}.tgz"
	'updater.pl')
install=$pkgname.install

_installDir=/usr/share/$pkgname

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
	# don't clear screen, fail to update system mime database, install broken desktop file, or burble
	sed -i 's/^\s*\(system("clear"\|system("update-mime-database \|createDesktopShortcuts(\|printf(\$TRANSLATABLE\).*;//' install.pl

	# don't show EULA/ask for confirmation (EULA is addressed in install script)
	update='--update'
	# keep packages unless updating from within application
	[[ -z "$_UPDATING" ]] && keepPackages='-k' || update='--upgrade'

	./install.pl $update $keepPackages --installDir=$_installDir -v
	install -m644 -b updater.pl $_installDir/updater.pl
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt
        # pixmap for legacy customised mimetypes
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm

	# create startup script and desktop file
	cat > $pkgdir/usr/bin/$pkgname <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		# nouveau bug with QT web engine: https://bugreports.qt.io/browse/QTBUG-41242
		lsmod | grep nouveau && export QT_XCB_FORCE_SOFTWARE_OPENGL=1
		exec ./"${_productUrname/_/.}" "\$@"
	EOF
	cat > $pkgdir/usr/share/applications/$pkgname.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=$_productRename
		Comment=Offline client for cewe.de service
		Exec=$pkgname
		Icon=hps-$_keyaccount-$pkgver
		StartupNotify=true
		Categories=Graphics;Photography;
		MimeType=application/x-hps-mcf
	EOF
	chmod 755 $pkgdir/usr/bin/$pkgname $pkgdir/usr/share/applications/$pkgname.desktop

	# adjust product name in mimetype comment
	sed -i "s/$_productUrname/$_productRename/" $pkgdir/usr/share/mime/packages/*
	# remove unneeded mime cache files and installation logs
	rm -d $pkgdir/usr/share/mime/application/* $pkgdir/usr/share/mime/* \
		$_installDir/.log/* $_installDir/.log &> /dev/null || true
	echo
}
# template end;
