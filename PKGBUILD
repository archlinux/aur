
_prams=(fr_FR 7884 'Logiciel de création CEWE' 8.0.4 "CEWE France")

pkgname="cewe-france"
pkgver=8.0.4
pkgrel=1

## Begin shared code ##
pkgdesc="un client hors ligne pour créer des livres photo et d'autres produits photo et les commander auprès de CEWE ou de partenaires"
# 7.3.1 segfaults without this:
options=(!strip)

source="https://dls.photoprintit.com/download/Data/${_prams[1]}-${_prams[0]}/hps/setup_$(echo ${_prams[2]} | iconv -t ascii//TRANSLIT | sed 's/[ .]/_/g').tgz"

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

conflicts=(cewe-fotowelt cewe-fotobuch)
conflicts=(${conflicts[@]/$pkgname/})

url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'snappy' 'libxcrypt-compat')
makedepends=('p7zip' 'xdg-utils')
arch=('i686' 'x86_64')
source=($source)
md5sums=(d85225335c8980f9648192e30e1167f9)
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

	./install.pl $update $keepPackages --installDir="$_installDir" -v

	# install -m644 -b updater.pl $_installDir/updater.pl
	# sed -i "s/APPLICATION NAME/$_productRename/" $_installDir/updater.pl
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
	# make executables executable and resources available to all users
	chmod 755 $pkgdir/usr/bin/$pkgname $pkgdir/usr/share/applications/$pkgname.desktop $(find $_installDir -type d)

	# adjust product name in mimetype comment
	# sed -i "s/$_productUrname/$_productRename/" $pkgdir/usr/share/mime/packages/*
	# remove unneeded mime cache files and installation logs
	rm -d $pkgdir/usr/share/mime/application/* $pkgdir/usr/share/mime/* \
		$_installDir/.log/* $_installDir/.log &> /dev/null || true
	echo
}
