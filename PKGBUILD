# Maintainer: Tim Clifford <tclifford at protonmail dot com>

pkgname=gplates-deb
pkgver=2.2
pkgrel=1
pkgdesc="GPlates AppImage (from the Ubuntu Xenial .deb)"
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
  https://sourceforge.net/projects/gplates/files/gplates/${pkgver}/gplates-ubuntu-xenial_${pkgver}_1_amd64.deb
)
md5sums=(
  5f40760e7d3448a413354bbdcb72e529
  2ec83c32d7c3ac889097e2835188ad58
  4476faf94d5d8c919aeaa34aa0b2ed04
  29b5588e48f5705029ab3e954d16e40b
  6ab1bd1d080e3a5815e2a282b33909a9
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
