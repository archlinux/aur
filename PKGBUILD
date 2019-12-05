# Maintainer: Christian Wolf <aur at christianwolf dot email>
# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=dm-fotowelt-cewe
pkgver=7.0.1
pkgrel=1
pkgdesc="an offline client for uploading and ordering photos at dm Drogerie Markt using cewe.de"
url="https://www.fotoparadies.de"
license=("custom:eula")
depends=('libx11' 'curl')
makedepends=('unzip' 'coreutils' 'less' 'wget')
arch=('x86_64')
source=("dmfotowelt.desktop" "cewefotoschau.desktop")
install='dmfotowelt.install'
conflicts=('mullerfoto-fotostar_de' 'mullerfoto-fotostar_cz' 'mullerfoto-fotostar_sk')
md5sums=(
         '2d026a7cae1ff88883377d0c0457426c'
         '99cfd65346488726fd34d504b50693c6')

build() (
	cd $srcdir
	rm -rf dist
	mkdir -p dist/usr/{share/$pkgname,bin}
	
	# Magic numbers from installer script
	DOWNLOAD_SERVER=http://dls.photoprintit.de/
	KEYACCID=1320
	FULL_LOCALE='de_DE'
	CLIENTID=38
	HPS_VER=$pkgver
	
	# download list of links
	wget -O url_list.txt "${DOWNLOAD_SERVER}download/Data/${KEYACCID}-${FULL_LOCALE}/hps/${CLIENTID}-index-${HPS_VER}.txt" || return 1
	
	echo "Downloading and extracting additional files.."
	
	check_file_md5() {
		file_md5sum=$(echo "$1" | sed -E 's@.*_([0-9a-fA-F]*)\.zip@\1@')
		md5sum --quiet -c <(echo "$file_md5sum  $1")
	}
	
	awk -F\; '$4 ~ "l64" || $4 ~ "a" {print $1}' url_list.txt | while read url
	do
		filename=$(echo "$url" | sed 's@^.*/@@')
		echo -n "Fetching $filename..."
		if [ -r "$filename" ]; then
			ret=0
			check_file_md5 "$filename" &>/dev/null || ret=$?
			
			if [ $ret -eq 0 ]; then
				echo 'locally found.'
			else
				echo 'locally defective. Removing.'
				rm "$filename"
			fi
		fi
		
		if [ ! -r "$filename" ]; then
			echo 'starting download.'
			wget "$DOWNLOAD_SERVER$url" || return 1
		fi
		
		# Checking the MD5SUM finally
		check_file_md5 "$filename"
		
		# Unzip the file
		unzip -q -d dist/usr/share/$pkgname "$filename"
	done
	
	echo 'Finishing installation'
	cd dist
	
	# Remove any file with a leading dot
	find . -name '.*' -delete
	
	pushd usr/share/$pkgname > /dev/null
	
	# Creating links to shared objects
	
	local version_array=()
# 	rm {libCWImageLoader,libCWGUIWidgets}.so{,.0,.0.1} libexpat.so{,.1}
	for lib in *.so.*; do
		
		libversion=$(echo $lib | sed -n 's/\(.*\).so\.\(.*\)/\2/p')
		libname=$(echo $lib | sed -n 's/\(.*\.so\)\..*/\1/p');
		
		ln -s "$lib" "${libname}" || true
		
		IFS=$'.' read -a version_array <<< "${libversion}"
		unset IFS
		
		n=${#version_array[*]}
		
		local target=""
		for ((i=0; i<n-1; i++)); do
			target=$(echo -n "$target"."${version_array[i]}")
			ln -s "$lib" "${libname}${target}" || true
		done
	done
	
	# space in executable filenames is generally a bad idea
	mv "CEWE FOTOSCHAU" "CeweFotoschau"
	mv "CEWE FOTOIMPORTER" "CeweFotoimporter"
	
	# Ensure files are executable
	chmod 0755 ./dm-Fotowelt
	chmod 0755 ./CeweFotoschau
	chmod 0755 ./CeweFotoimporter
	chmod 0755 ./faceRecognition
		
	popd > /dev/null
	
	# Creating startup scripts
	
	cat > usr/bin/CeweFotoschau << EOF
#! /bin/sh
cd /usr/share/$pkgname
./CeweFotoschau "\$@"
EOF
	chmod 0755 usr/bin/CeweFotoschau
	
	cat > usr/bin/dm-Fotowelt << EOF
#! /bin/sh
cd /usr/share/$pkgname
./dm-Fotowelt "\$@"
EOF
	chmod 0755 usr/bin/dm-Fotowelt
	
	cd ..
	
)

package() {
	# Copy dist folder
	cp -a $srcdir/dist/* $pkgdir
	
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
	
	# Install EULA
	install -D -m644 $srcdir/dist/usr/share/$pkgname/Resources/keyaccount/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt

	# create desktop shortcut
	pushd $srcdir/dist/usr/share/$pkgname > /dev/null
	
	install -D -m644 Resources/keyaccount/fotoschau.xpm $pkgdir/usr/share/pixmaps/fotoschau.xpm
	install -D -m644 $srcdir/cewefotoschau.desktop $pkgdir/usr/share/applications/cewefotoschau.desktop
	
	install -D -m644 Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/dmfotowelt.xpm
	install -D -m644 $srcdir/dmfotowelt.desktop $pkgdir/usr/share/applications/dmfotowelt.desktop
	
	popd >/dev/null
}
