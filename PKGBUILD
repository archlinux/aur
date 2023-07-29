# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname='anituner'
pkgdesc='Create, edit and convert Windows animated cursors'

pkgver=2.0.0
pkgrel=2

arch=(i686 x86_64)

url='https://www.gdgsoft.com/anituner'
license=('freeware')

depends=(wine)
makedepends=(unzip gendesk icoutils)

provides=(anituner)

source=('https://download.gdgsoft.com/anitun2p.zip')
md5sums=('f0cff36790da5e3f9b02a65aa4d64101')

#pkgver() {
#	peres -v ${srcdir}/AniTuner.exe -f csv | tail -n 1 | awk -F',' '{print $NF}'
#}

prepare() {
	# make a temporary directory for generated files
	mkdir -p ${startdir}/tmp

	# move into the temporary directory
	cd ${startdir}/tmp

	# extract the icon out of the executable
	wrestool -x -t14 ${srcdir}/AniTuner.exe --output AniTuner.ico

	# get the highest quality PNG from the icon file
	icotool -x AniTuner.ico -i 6 --output AniTuner.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname AniTuner \
		--pkgdesc "${pkgdesc}" \
		--exec anituner \
		--icon AniTuner.png \
		--categories 'Graphics;Utility' \
		--mimetypes 'image/bmp;image/jpeg;image/png;image/gif;image/vnd.adobe.photoshop;image/x-icon;image/x-win-bitmap;application/x-navi-animation;application/anituner-atd'
}

package() {
	# rename the default configuration file
	mv ${srcdir}/AniTunerPref.xml ${srcdir}/AniTunerPrefDefault.xml

	# make the required directories
	mkdir -p ${pkgdir}/usr/share/anituner
	mkdir -p ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/mime/packages

	# copy all of AniTuner's files
	cp -r ${srcdir}/* ${pkgdir}/usr/share/anituner

	# remove the symlink to the ZIP from the package files
	rm -f ${pkgdir}/usr/share/anituner/anitun2p.zip

	# copy the script
	cp -r ${startdir}/anituner ${pkgdir}/usr/bin

	# copy the extracted icon and the generated .desktop file
	cp -r ${startdir}/tmp/AniTuner.png ${pkgdir}/usr/share/pixmaps
	cp -r ${startdir}/tmp/AniTuner.desktop ${pkgdir}/usr/share/applications

	# copy the custom MIME type
	cp -r ${startdir}/anituner-atd.xml ${pkgdir}/usr/share/mime/packages
}
