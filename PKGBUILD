# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=mullerfoto-fotostar_de
pkgver=4.6.8
pkgrel=2
pkgdesc="an offline client for uploading and ordering photos at cewe.de - Schlecker Foto Digital Service (used to be FotoStar Client)"
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'curl')
arch=('i686')
source=("http://dls.photoprintit.de/download/Data/1119/hps/Schlecker_Fotoservice.tgz" "schleckerfotodigiservice.desktop" "cewefotoschau.desktop")
install=('schleckerfotodigiservice.install')
conflicts=('mullerfoto-fotostar_cz' 'mullerfoto-fotostar_sk')
md5sums=('c8a30c0bbc36cea3400fbd097e908116'
         '15f89990079d333ad3ac54f4df2082a9'
         'c360fa7f1e3b16853062922c38fc5559')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
	KEYACCID=1119
	CLIENTID=38
	HPS_VER=$pkgver
	# download list of links
	wget -O url_list.txt "http://dls.photoprintit.de/download/Data/${KEYACCID}/hps/${CLIENTID}-index-${HPS_VER}.txt"
	echo "Downloading and extracting files.."
	for url in $(awk -F\; '{print $1}' url_list.txt|egrep -v "dll|cewe|setup_Mueller|setup_Fotostar|setup_bol_de|setup_Moj_CeWe"); do
		wget "http://dls.photoprintit.de/$url"
		unzip -d $pkgdir/usr/share/$pkgname $(basename $url)
	done
	echo "Creating symlinks.."
	# weird stuff, but this is what the installation script is doing also
	cd $pkgdir/usr/share/$pkgname
	version_array=()
	rm {libCWImageLoader,libCWGUIWidgets}.so{,.0,.0.1} libexpat.so{,.1}
	for source in *.so*; do
		libversion=$(echo $source|sed -n 's/\(.*\).so\.\(.*\)/\2/p')
		libname=$(echo $source|sed -n 's/\(.*\.so\)\..*/\1/p');
		IFS=$'.' read -a version_array <<< "${libversion}"
		unset IFS
		n=${#version_array[*]}
		target=()
		for ((i=0;i<n-1;i++)); do
			target=$(echo -n "$target"."${version_array[i]}")
			ln -s "$source" "${libname}${target}" || true
		done
	done
	# space in executable filenames is generally a bad idea
	mv "SCHLECKER Foto Digital Service" "SchleckerFotoDigitalService"
	mv "CEWE FOTOSCHAU" "CeweFotoschau"
	# make files executable
	chmod 0755 ./SchleckerFotoDigitalService
	chmod 0755 ./CeweFotoschau
	chmod 0755 ./assistant
	chmod 0755 ./facedetection
	# copy EULA
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt
	# create startup script
	(echo "#!/bin/bash
cd /usr/share/$pkgname
./CeweFotoschau \"\$@\"") > $pkgdir/usr/bin/CeweFotoschau
	(echo "#!/bin/bash
cd /usr/share/$pkgname
./SchleckerFotoDigitalService \"\$@\"") > $pkgdir/usr/bin/SchleckerFotoDigitalService
	chmod 0755 $pkgdir/usr/bin/SchleckerFotoDigitalService
	chmod 0755 $pkgdir/usr/bin/CeweFotoschau
	# create desktop shortcut
	install -D -m644 Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/schleckerfotodigiservice.xpm
	install -D -m644 Resources/keyaccount/fotoschau.xpm $pkgdir/usr/share/pixmaps/fotoschau.xpm
	install -D -m644 $srcdir/schleckerfotodigiservice.desktop $pkgdir/usr/share/applications/schleckerfotodigiservice.desktop
	install -D -m644 $srcdir/cewefotoschau.desktop $pkgdir/usr/share/applications/cewefotoschau.desktop
}
