# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software
# for dm Fotóvilág: based on PKGBUILD of https://aur.archlinux.org/packages/dm-fotowelt/

_keyaccount=2376
_productUrname='dm Fotóvilág'
_productRename='dm Fotóvilág'

pkgname=dm-fotovilag
pkgdesc='an offline client for creating photobooks, greeting cards, posters and more, uploading and ordering them at dm-digifoto.hu'
sha256sums=('SKIP')
pkgver=8.0.5
pkgrel=1
url="https://www.dm-digifoto.hu/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy' 'libxcrypt-compat')
conflicts=(cewe-fotowelt cewe-fotobuch cewe-fotoservice cewe-monlivrephoto-fnac cewe-monlivrephoto-fr dm-fotowelt)
makedepends=('p7zip' 'xdg-utils')
arch=('i686' 'x86_64')
# https://dls.photoprintit.com/api/getClient/1320-de_DE/hps/x_x_x_x_24441_x_24441-0yELEgWuBDCUV/linux
# https://dls.photoprintit.com/api/getClient/2376-hu_HU/hps/x_x_x_x_2376_x_02376-f6gF3NpI9Vy8O/linux
source=("https://dls.photoprintit.com/api/getClient/2376-hu_HU/hps/x_x_x_x_2376_x_02376-f6gF3NpI9Vy8O/linux")
install=$pkgname.install
options=(!strip)

_installDir=/usr/share/$pkgname

pkgver() {
	grep 'my $HPS_VER' $srcdir/install.pl | grep -Po '[[:digit:]\.]+'
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

	# create startup script and desktop file
	cat > $pkgdir/usr/bin/$pkgname <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		# nouveau bug with QT web engine: https://bugreports.qt.io/browse/QTBUG-41242
		lsmod | grep nouveau && export QT_XCB_FORCE_SOFTWARE_OPENGL=1
		exec ./"${_productUrname}" "\$@"
	EOF
	cat > $pkgdir/usr/share/applications/$pkgname.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=$_productRename
		Comment=Offline client for dm-digifoto.hu service
		Exec=$pkgname
		Icon=hps-$_keyaccount-$pkgver
		StartupNotify=true
		Categories=Graphics;Photography;
		MimeType=application/x-hps-mcf
	EOF
	chmod 755 $pkgdir/usr/bin/$pkgname $pkgdir/usr/share/applications/$pkgname.desktop $(find $_installDir -type d)

	# adjust product name in mimetype comment
	sed -i "s/$_productUrname/$_productRename/" $pkgdir/usr/share/mime/packages/*
	# remove unneeded mime cache files and installation logs
	rm -d $pkgdir/usr/share/mime/application/* $pkgdir/usr/share/mime/* \
		$_installDir/.log/* $_installDir/.log &> /dev/null || true
	echo
}
# template end;

