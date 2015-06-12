# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=mullerfoto-fotostar_sk
pkgver=4.6.7
pkgrel=1
pkgdesc="an offline client for uploading and ordering photos at fotolab.sk (aka FotoStar Client)"
url="http://www.fotolab.sk/"
license=("custom:eula")
depends=('libx11' 'curl')
arch=('i686')
source=("http://dls.photoprintit.de/download/Data/5316/hps/setup_Moj_CEWE_FOTOSVET_46.tgz" "mullerfoto.desktop")
install=('mullerfoto.install')
conflicts=('mullerfoto-fotostar_de' 'mullerfoto-fotostar_cz')
md5sums=('d1f2d5913de2a0652255e3f608c2ec93'
         '7d751150ce96432e66a28b4e8fd6aca2')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
	KEYACCID=5316
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
	for source in *.so*; do
		libversion=$(echo $source|sed -n 's/\(.*\).so\.\(.*\)/\2/p')
		libname=$(echo $source|sed -n 's/\(.*\.so\)\..*/\1/p');
		IFS=$'.' read -a version_array <<< "${libversion}"
		unset IFS
		n=${#version_array[*]}
		target=()
		for ((i=0;i<n-1;i++)); do
			target=$(echo -n "$target"."${version_array[i]}")
			rm "${libname}${target}" || true
			ln -s "$source" "${libname}${target}"
		done
	done
	# utf-8 and space in executable filenames is generally a bad idea
	mv M*"CEWE FOTOSVET" "MullerFoto"
	# make files executable
	chmod 0755 ./MullerFoto
	chmod 0755 ./assistant
	#chmod 0755 "./CEWE n*"
	chmod 0755 ./facedetection
	# copy EULA
	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt
	# create startup script
	(echo "#!/bin/bash
cd /usr/share/$pkgname
./MullerFoto \"\$@\"") > $pkgdir/usr/bin/MullerFoto
	chmod 755 $pkgdir/usr/bin/MullerFoto
	# create desktop shortcut
	install -D -m644 Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/mullerfoto.xpm
	install -D -m644 $srcdir/mullerfoto.desktop $pkgdir/usr/share/applications/mullerfoto.desktop
}
