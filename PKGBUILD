# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software
# for dm Fotowelt: based on PKGBUILD of https://aur.archlinux.org/packages/cewe-fotobuch/

_keyaccount=1320
_productUrname='dm Fotowelt'
_productRename='dm Fotowelt'
_lang='de_DE'

pkgname=dm-fotowelt
pkgdesc='an offline client for creating photobooks, greeting cards, posters and more, uploading and ordering them at fotoparadies.de'
sha256sums=('7a7dfc3f99bbac5ec069633085a100f888cd4fa8c8e4f27ca07d1ab5287946de')

pkgver=7.0.1
pkgrel=1
url="https://www.fotoparadies.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy')
makedepends=('unzip')
arch=('i686' 'x86_64')
# https://dls.photoprintit.com/api/getClient/1320-de_DE/hps/x_x_x_x_24441_x_24441-0yELEgWuBDCUV/linux
source=("https://dls.photoprintit.com/download/Data/$_keyaccount-$_lang/hps/setup_${_productUrname// /_}.tgz")
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
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt
        # pixmap for legacy customised mimetypes
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm

	# create startup script and desktop file
	cat > $pkgdir/usr/bin/$pkgname <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		# nouveau bug with QT web engine: https://bugreports.qt.io/browse/QTBUG-41242
		lsmod | grep nouveau && export QT_XCB_FORCE_SOFTWARE_OPENGL=1
		exec ./"${_productUrname// /-}" "\$@"
	EOF
	cat > $pkgdir/usr/share/applications/$pkgname.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=$_productRename
		Comment=Offline client for fotoparadies.de service
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

