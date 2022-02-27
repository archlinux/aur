# Maintainer: Tim Clifford <tim at clifford dot lol>

pkgname=gplates-bin
pkgver=2.3
pkgrel=1
pkgdesc="GPlates - a plate tectonics program. Built as an AppImage from the .deb"
arch=('x86_64')
url="https://www.gplates.org"
license=('GPL2')
makedepends=('dpkg' 'imagemagick' 'wget' 'desktop-file-utils')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  gplates.sh
  gplates-appimage.yml
  gplates.png
  https://raw.githubusercontent.com/AppImage/pkg2appimage/master/pkg2appimage
  gplates_2.3.0_ubuntu-20.04-amd64.deb::https://www.earthbyte.org/download/8430
)
md5sums=(
  5f40760e7d3448a413354bbdcb72e529
  6a85bf12313cd662f7cd23a05f978ca2
  4476faf94d5d8c919aeaa34aa0b2ed04
  29b5588e48f5705029ab3e954d16e40b
  871ab30b353286f2e812ee22667ebb83
)

build() {
	# put deb and icon in place
	mkdir -p gplates
	ln -sf $(realpath *.deb) gplates/
	cp $(realpath gplates.png) gplates/

	# create appimage
	_SOURCE_DATE_EPOCH=$SOURCE_DATE_EPOCH
	unset SOURCE_DATE_EPOCH
	bash -ex ./pkg2appimage gplates-appimage.yml
	SOURCE_DATE_EPOCH=$_SOURCE_DATE_EPOCH
}

package() {
	ls -l out
	INSTALL_PATH="/opt/appimages/gplates.AppImage"

	# install icons
	install -Dm644 "gplates.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gplates.png"

	# install image file and desktop file
	install -Dm755 ./out/*.AppImage "$pkgdir/opt/appimages/gplates.AppImage"
	install -Dm644 "gplates/gplates.AppDir/gplates.desktop" \
		"$pkgdir/usr/share/applications/gplates.desktop"

	# install wrapper in /usr/bin
	install -Dm755 "gplates.sh" "$pkgdir/usr/bin/gplates"

}
