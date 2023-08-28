# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname='resource-hacker'
pkgdesc='A resource editor for 32/64-bit Windows applications'

pkgver=5.1.7
pkgrel=1

arch=(i686 x86_64)

url='http://www.angusj.com/resourcehacker'
license=('freeware')

depends=(wine)
makedepends=(unzip gendesk icoutils)

provides=(resource-hacker)

source=('http://www.angusj.com/resourcehacker/resource_hacker.zip')
md5sums=('672f980eee75e8223060661227ba884f')

prepare() {
	# make a temporary directory for generated files
	mkdir -p ${startdir}/tmp

	# move into the temporary directory
	cd ${startdir}/tmp

	# extract the icon out of the executable
	wrestool -x -n MAINICON ${srcdir}/ResourceHacker.exe -o ResourceHacker.ico

	# get the highest quality PNG from the icon file
	icotool -x ResourceHacker.ico -i 1 -o ResourceHacker.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Resource Hacker" \
		--pkgdesc "${pkgdesc}" \
		--exec resource-hacker \
		--icon ResourceHacker.png \
		--categories 'Development;Utility'

	# rename the generated .desktop file
	mv "Resource Hacker.desktop" ResourceHacker.desktop
}

package() {
	# make the required directories
	mkdir -p ${pkgdir}/usr/share/resource-hacker
	mkdir -p ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps

	# copy all of Resource Hacker's files
	cp -r ${srcdir}/* ${pkgdir}/usr/share/resource-hacker

	# remove the symlink to the ZIP from the package files
	rm -f ${pkgdir}/usr/share/resource-hacker/resource_hacker.zip

	# copy the script
	cp -r ${startdir}/resource-hacker ${pkgdir}/usr/bin

	# copy the extracted icon and the generated .desktop file
	cp -r ${startdir}/tmp/ResourceHacker.png ${pkgdir}/usr/share/pixmaps
	cp -r ${startdir}/tmp/ResourceHacker.desktop ${pkgdir}/usr/share/applications
}
