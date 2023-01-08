# Maintainer: James Crompton DonJaime at freenet de
# forked from cewe-fotobuch, originally by Jozef Riha, updated by Manuel Conzelmann

# to package a different version, change this to one of the words after '_prams_' below
# or download a setup file from a local CEWE site, put it in the same folder as this file, and run:
# _SETUP_FILE=<filename> makepkg
_productVariant=Germany
# leave this unset to get a package name based on the application name
pkgname=
pkgrel=3

## Begin shared code ##
pkgdesc='an offline client for creating photobooks and other photo products and ordering them from CEWE or partners'
# 7.3.1 segfaults without this:
options=(!strip)

declare -g -A _scriptTailMd5sums
_scriptTailMd5sums[7.1]=1b231f3988603dbec4e857e247784295
_scriptTailMd5sums[7.2]=d9edd2bb89870dc61692e73f81fe0efa
_scriptTailMd5sums[7.3]=8cf896344365958462902bfb340201cd

# locale, key account, original name, version, (optional) replacement name
_prams_Austria=(de_AT 29762 'CEWE Fotowelt' 7.1.4)
_prams_Belgie=(nl_BE 28049 'CEWE Photoservice' 7.1.4)
_prams_Belgique=(fr_BE 28049 'CEWE Photoservice' 7.1.4)
_prams_Czechia=(cs_CZ 4860 'CEWE FOTOLAB fotosvet' 7.1.3 "CEWE fotosvět")
_prams_France=(fr_FR 7884 'Logiciel de création CEWE' 7.1.5)
_prams_Fnac=(fr_FR 18455 'Atelier Photo Fnac' 7.1.3)
_prams_Fotobuch=(de_DE 16523 'Mein CEWE FOTOBUCH' 7.3.1 'CEWE Fotobuch')
_prams_Germany=(de_DE 24441 'CEWE Fotowelt' 7.3.1)
_prams_Italy=(it_IT 19991 'CEWE.IT Foto World' 7.1.5)
_prams_Luxemburg=(de_LU 32905 'CEWE Photoservice' 7.1.5)
_prams_Luxembourg=(fr_LU 32905 'CEWE Photoservice' 7.1.4)
_prams_Netherlands=(nl_NL 28035 'CEWE Fotoservice' 7.1.4)
_prams_Poland=(pl_PL 29241 'CEWE Fotoswiat' 7.1.4 'CEWE Fotoświat')
_prams_Slovakia=(sk_SK 31916 'CEWE fotosvet' 7.1.3)
_prams_Slovenia=(sl_SI 17409 'CEWE Fotosvet' 7.1.5)
_prams_Spain=(es_ES 29227 'Taller CEWE' 7.1.3)
_prams_UK=(en_GB 12611 'CEWE Creator' 7.1.3)

pkgver() {
	[ -z "$1" ] && set -- '$HPS_VER'
	grep -m1 "my $1" ${2}install.pl | grep -Po "'.*'" | grep -Po "[^']+"
}

if [ -z "$_SETUP_FILE" ]
then
	declare -n _prams=_prams_$_productVariant
	# remove any accents and replace spaces and dots for setup file name
	source="https://dls.photoprintit.com/download/Data/${_prams[1]}-${_prams[0]}/hps/setup_$(echo ${_prams[2]} | iconv -t ascii//TRANSLIT | sed 's/[ .]/_/g').tgz"
else
	mkdir -p src
	bsdtar -xf "$_SETUP_FILE" -C src install.pl

	_prams=('$FULL_LOCALE' '$KEYACCID' '$APPLICATION_NAME' '$HPS_VER' "$_RENAME")
	for _i in {0..3}
	do
		_prams[_i]="$(pkgver "${_prams[_i]}" src/)"
	done
	source="$_SETUP_FILE"
	[ $(whoami) != root -a -z "$_UPDATING" ] && echo -e "_prams_?=(${_prams[@]:0:2} '${_prams[2]}' ${_prams[3]})\n_scriptTailMd5sums[${_prams[3]%.*}]=$(md5sum <(sed '0,/AB HIER SOLLTE NICHTS MEHR GEAENDERT WERDEN/d' src/install.pl) | grep -Po '^[^ ]*')"
	[ -n "$_PRAMS_ONLY" ] && exit
fi

_keyaccount=${_prams[1]}
# what they call their package (e.g. MY CEWE TOO MANY CAPITALS)
_productUrname=${_prams[2]}
# what I want to call it (e.g. CEWE Sensible Name)
[ -z "${_prams[4]}" ] && _productRename="$_productUrname" || _productRename=${_prams[4]}

# remove accents, lowercase and replace spaces for package name
[ -z "$pkgname" ] && pkgname="$(iconv -t ascii//TRANSLIT <(echo $_productRename))"
pkgname=${pkgname,,}
pkgname=${pkgname// /-}
[ -f CEWE.install -a "$BUILDPKG" != 0 ] && sed "s/CEWE/$pkgname/" CEWE.install > $pkgname.install

conflicts=(cewe-fotowelt cewe-fotobuch cewe-fotoservice cewe-monlivrephoto-fnac cewe-monlivrephoto-fr)
conflicts=(${conflicts[@]/$pkgname/})

pkgver=${_prams[3]}
source=($source 'updater.pl')
md5sums=(SKIP SKIP)

url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy' 'libxcrypt-compat' 'libtiff5')
makedepends=('unzip' 'xdg-utils')
arch=('i686' 'x86_64')
source=($source 'updater.pl')
install="$pkgname.install"

_installDir=/usr/share/$pkgname

check() {
	# from start of script, where parameters are set:
	local setRightDownloadServer="$(sed '0,/AB HIER SOLLTE NICHTS MEHR GEAENDERT WERDEN/p;d' "$src"install.pl | grep -Po '^my \$DOWNLOAD_SERVER\t+= "https://dls.photoprintit.com";')"
	local mentionDownloadServer="$(sed '0,/AB HIER SOLLTE NICHTS MEHR GEAENDERT WERDEN/p;d' "$src"install.pl | grep -Po '.*\$DOWNLOAD_SERVER[^\r]*')"
	# for body of script, after parameters set:
	local md5sum=$(md5sum <(sed '0,/AB HIER SOLLTE NICHTS MEHR GEAENDERT WERDEN/d' "$src"install.pl) | grep -Po '^[^ ]*')

	# only mention of server variable in parameter section should be to set correct server;
	# md5sum of script body should match package version unless a setup file was provided:
	[ "$mentionDownloadServer" == "$setRightDownloadServer" ] && [ "${_scriptTailMd5sums[${pkgver%.*}]}" == $md5sum -o -n "$_SETUP_FILE" ]
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
	[ -z "$_UPDATING" ] && keepPackages='-k' || update='--upgrade'

	./install.pl $update $keepPackages --installDir="$_installDir" -v

	install -m644 -b updater.pl $_installDir/updater.pl
	sed -i "s/APPLICATION NAME/$_productRename/" $_installDir/updater.pl
	rm $_installDir/uninstall.pl

	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt

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
