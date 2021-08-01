# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software

# to package a different version, change this or download a setup file and run:
# _SETUP_FILE=<filename> makepkg
_productVariant=Fotobuch
# leave this unset to get a package name based on the application name
pkgname=

conflicts=(cewe-fotowelt cewe-fotoservice cewe-monlivrephoto-fnac cewe-monlivrephoto-fr)
pkgdesc='an offline client for creating photobooks and other photo products and ordering them from CEWE or partners'

# locale, key account, original name, version, md5sum, (optional) replacement name
_prams_Czechia=(cs_CZ 4860 'CEWE FOTOLAB fotosvet' 7.1.3 a6a2db001621a25dd36db214ce420b94 "CEWE fotosvět")
_prams_France=(fr_FR 7884 'Logiciel de création CEWE' 7.1.3 d05b5491c95c14d32195b5d8cbc27c23)
_prams_Fnac=(fr_FR 18455 'Atelier Photo Fnac' 7.1.3 e34b967b54520f59a8241ece3c4bc8f2)
_prams_Fotobuch=(de_DE 16523 'Mein CEWE FOTOBUCH' 7.1.4 c4095abf2f8fd7873a007a3b2429e285 'CEWE Fotobuch')
_prams_Germany=(de_DE 24441 'CEWE Fotowelt' 7.1.4 1f48a372a529a1c114eab8a983f6b119)
_prams_Poland=(pl_PL 29241 'CEWE Fotoswiat' 7.1.3 18f4cb458c729cee0bffb006bcc12a51 'CEWE Fotoświat')
_prams_Slovakia=(sk_SK 31916 'CEWE fotosvet' 7.1.3 d7b4cee0eb3ebd0d0d24b7c2d15ea868)
_prams_UK=(en_GB 12611 'CEWE Creator' 7.1.3 7ebc546641a0417de04b8ae5e21acfa1)

if [ -z "$_SETUP_FILE" ]
then
	declare -n _prams=_prams_$_productVariant
	# replace spaces and remove any accents for setup file name
	source="https://dls.photoprintit.com/download/Data/${_prams[1]}-${_prams[0]}/hps/setup_$(iconv -t ascii//TRANSLIT <(echo ${_prams[2]// /_})).tgz"
else
	mkdir -p src
	bsdtar -xf "$_SETUP_FILE" -C src install.pl

	_prams=('$FULL_LOCALE' '$KEYACCID' '$APPLICATION_NAME' '$HPS_VER' SKIP "$_RENAME")
	for _i in {0..3}
	do
		_prams[_i]="$(grep -m1 "my ${_prams[_i]}" src/install.pl | grep -Po "'.*'" | grep -Po "[^']+")"
	done
	source="$_SETUP_FILE"
	[ $(whoami) != root -a -z "$_UPDATING" ] && echo "parameters: (${_prams[@]:0:2} '${_prams[2]}' ${_prams[3]} $(md5sum $source | grep -Po '^[^ ]*'))"
fi

_keyaccount=${_prams[1]}
# what they call their package (e.g. MY CEWE TOO MANY CAPITALS)
_productUrname=${_prams[2]}
# what I want to call it (e.g. CEWE Sensible Name)
[ -z "${_prams[5]}" ] && _productRename="$_productUrname" || _productRename=${_prams[5]}

# remove accents, lowercase and replace spaces for package name
[ -z "$pkgname" ] && pkgname="$(iconv -t ascii//TRANSLIT <(echo $_productRename))"
pkgname=${pkgname,,}
pkgname=${pkgname// /-}
sed "s/PACKAGE NAME/$pkgname/" CEWE.install > $pkgname.install

pkgver=${_prams[3]}
pkgrel=3
source=($source 'updater.pl')
md5sums=(${_prams[4]} 'SKIP')

url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy')
makedepends=('unzip' 'xdg-utils')
arch=('i686' 'x86_64')
source=($source 'updater.pl')
install="$pkgname.install"

_installDir=/usr/share/$pkgname

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
	[ -z "$_UPDATING" ] && keepPackages='-k' || update='--upgrade'

	./install.pl $update $keepPackages --installDir=$_installDir -v

	install -m644 -b updater.pl $_installDir/updater.pl
	sed -i "s/APPLICATION NAME/$_productRename/" $_installDir/updater.pl

	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt
        # pixmap for legacy customised mimetypes
	install -D -m644 $_installDir/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm

	# create startup script and desktop file
	cat > $pkgdir/usr/bin/$pkgname <<-EOF
		#!/usr/bin/bash
		cd ${_installDir#$pkgdir}
		# nouveau bug with QT web engine: https://bugreports.qt.io/browse/QTBUG-41242
		lsmod | grep nouveau && export QT_XCB_FORCE_SOFTWARE_OPENGL=1
		exec ./"${_productUrname/_/ }" "\$@"
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
