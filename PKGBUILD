# Maintainer: James Crompton DonJaime at freenet de
# forked from cewe-fotobuch, originally by Jozef Riha, updated by Manuel Conzelmann

_keyaccount=6822
_productUrname='OnlineFotoservice'
_productRename='CEWE Fotoservice'
_setupFilename='setup_OnlineFotoservice'

pkgname=cewe-fotoservice
conflicts=(cewe-fotobuch)
pkgdesc='an offline client for creating photobooks and other photo products and ordering them at cewe.de or partners'
md5sums=('6b8b2ad275fd5f968ed7625447c242a4'
         '422a405d520e18ef9afade2e7c24440b')

pkgver=6.2.1
pkgrel=4
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'gstreamer0.10-base')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.de/download/Data/$_keyaccount/hps/$_setupFilename.tgz"
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
		Comment=Offline client for cewe.de service
		Exec=$pkgname
		Icon=hps-$_keyaccount
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
