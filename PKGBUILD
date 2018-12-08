# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: Arnaud Sevin <nono31 [at] gmail [dot] com>, repo at https://github.com/nono031/cewe-monlivrephoto.git
# forked from cewe-fotoservice by James Crompton, itself forked from cewe-fotobuch, originally by Jozef Riha, updated by Manuel Conzelmann
# Updated by Zoe <chp321 at gmail dot com>, for french version

#_keyaccount=14227
_keyaccount=18455
# _productUrname='Mon LIVRE PHOTO CEWE'
_productUrname='Atelier Photo Fnac'
#_productRename='LIVRE PHOTO CEWE'
_productRename='Atelier Photo Fnac'
#_setupFilename='setup_Mon_LIVRE_PHOTO_CEWE'
_setupFilename='setup_Atelier_Photo_Fnac'

pkgname=cewe-monlivrephoto
conflicts=('cewe-fotobuch' 'cewe-fotoservice' 'mullerfoto-fotostar_de')
pkgdesc="Création off-line de livres-photos, calendriers, posters…, disponibles ensuite en ligne à l'achat auprès de la FNAC"
# setup_Atelier_Photo_Fnac (script perl) is versatile too much, so it is better to skip its md5sum :
md5sums=(SKIP
         '2a3ccb8cbbb4c45c5b634efce189bcaa'  ## updater.pl
         '82baecba5be4c2af0cccf0f5bc0e00c7') ## $pkgname.install

pkgver=6.3.7
pkgrel=1
url="http://www.livrephoto-cewe.fr/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'gstreamer0.10-base-plugins' 'snappy')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.com/download/Data/$_keyaccount-fr_FR/hps/$_setupFilename.tgz"
	'updater.pl' "$pkgname.install")
install=$pkgname.install
_installDir=/usr/share/$pkgname
##########################################
# remaining code shared with cewe-fotoservice

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

	# don't show EULA/ask for confirmation if package is already installed
	which $pkgname &>/dev/null && update='--update'
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
		KDEHOME=\$HOME/.kde4 exec ./"$_productUrname" "\$@"
	EOF
	cat > $pkgdir/usr/share/applications/$pkgname.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=$_productRename
		Comment=Offline client for cewe.fr service, french version
		Exec=$pkgname
		Icon=hps-$_keyaccount.png
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
