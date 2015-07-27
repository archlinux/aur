# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software

pkgname=cewe-fotobuch
pkgver=6.0.4
pkgrel=1
pkgdesc="an offline client for creating photobooks, uploading and ordering them at cewe.de"
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.de/download/Data/16523/hps/setup_Mein_CEWE_FOTOBUCH.tgz" 
"cewe-fotobuch.desktop")
install=cewe-fotobuch.install
md5sums=('dbda60281fcff0a2c312156dece069e5'
         '481ac82e95881d2878da3973d29095f6')

_KEYACCID=16523
_CLIENTID=18


build() {
	cd $srcdir
#	# download list of links
#	wget -O url_list.txt "http://dls.photoprintit.de/download/Data/${_KEYACCID}/hps/${_CLIENTID}-index-$pkgver.txt" || return 1
#	echo "Downloading and extracting files.."
#	for url in $(awk -F\; '{print $1}' url_list.txt|egrep -v "dll|cewe|setup_Mueller|setup_Fotostar|setup_Meine_CeWe_Fotowelt_de|setup_Moj_CeWe"); do
#		wget "http://dls.photoprintit.de/$url" || return 1
#		unzip -o -d $srcdir $(basename $url) || return 1
#	done
}
package() {
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
        cd $srcdir
	./install.pl --installDir=$pkgdir/usr/share/cewe-fotobuch --workingDir=$srcdir -k -v
#	# copy EULA
#	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt || return 1
        # create startup script
	(echo "#!/bin/bash
	cd /usr/share/$pkgname
	./cewe-fotobuch \"\$@\"") > $pkgdir/usr/bin/cewe-fotobuch
        chmod 755 $pkgdir/usr/bin/cewe-fotobuch
        # utf-8 and space in executable filenames is generally a bad idea
	cd $pkgdir/usr/share/$pkgname
        mv "Mein CEWE FOTOBUCH" "cewe-fotobuch"
	# create desktop shortcut
	install -D -m644 $pkgdir/usr/share/$pkgname/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/cewe-fotobuch.xpm && \
	install -D -m644 $srcdir/cewe-fotobuch.desktop $pkgdir/usr/share/applications/cewe-fotobuch.desktop || return 1
}
