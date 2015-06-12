# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=mullerfoto-fotostar_cz
pkgver=4.6.8
pkgrel=2
pkgdesc="an offline client for uploading and ordering photos at fotolab.cz (aka FotoStar Client)"
url="http://foto-sberna.fotolab.cz/objednat-foto-komfortni-software-zdarma.html"
license=("custom:eula")
depends=('libx11' 'curl')
arch=('i686')
source=("http://dls.photoprintit.de/download/Data/4860/hps/setup_Fotolab_Fotosvet_4.tgz" "mullerfoto.desktop" "fotosvet.desktop")
install=('mullerfoto.install')
conflicts=('mullerfoto-fotostar_de' 'mullerfoto-fotostar_sk')
md5sums=('a7a70e128056fa8ebd0a6a6104488d3b'
         'de6d7b4e78b7e9ff17dad0631e373e9e'
         '442801b82feee66d61aa796d573b3d82')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
	KEYACCID=4860
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
	# non-ascii characters in executable filenames is generally a bad idea
	mv "CEWE prezentace fotografií" "MullerFoto"
	# make files executable
	chmod 0755 ./MullerFoto
	chmod 0755 ./assistant
	chmod 0755 ./Fotolab\ Fotosvet\ 4
	chmod 0755 ./facedetection
	# copy EULA
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt
	# create startup script
	(echo "#!/bin/bash
cd /usr/share/$pkgname
./Fotolab\ Fotosvet\ 4 \"\$@\"") > $pkgdir/usr/bin/Fotosvet4
	(echo "#!/bin/bash
cd /usr/share/$pkgname
./MullerFoto \"\$@\"") > $pkgdir/usr/bin/MullerFoto
	chmod 0755 $pkgdir/usr/bin/MullerFoto
	chmod 0755 $pkgdir/usr/bin/Fotosvet4
	# create desktop shortcut
	install -D -m644 Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/mullerfoto.xpm
	install -D -m644 Resources/keyaccount/fotoschau.xpm $pkgdir/usr/share/pixmaps/fotoschau.xpm
	install -D -m644 $srcdir/mullerfoto.desktop $pkgdir/usr/share/applications/mullerfoto.desktop
	install -D -m644 $srcdir/fotosvet.desktop $pkgdir/usr/share/applications/fotosvet.desktop
}
