# Contributer: Julian Daube <joposter (at) gmail (dot) com>

pkgname=necta-wifi-mouse
pkgdesc="wifi mouse for android (server part)"
pkgver=1.0.1
pkgrel=1
arch=("x86_64" "i686")
url=http://wifimouse.necta.us/

license=("unknown")
source=("icon.png")
source_x86_64=("mouseserver-x86_64.zip::http://wifimouse.necta.us/MouseServerLinux64.zip")
source_i686=("mouseserver-i686.zip::http://wifimouse.necta.us/MouseServerLinux32.zip")
md5sums=('671cbe35275357e3a42aa118a7e35a8f')
md5sums_x86_64=('422f9c2e394b04cbde95e762194ed6de')
md5sums_i686=('2b0dca3ffa174ef505a706f05cd36869')

depends=() 
makedepends=("sed" "tar")

prepare() {
	# extract deb
	suffix=$pkgver-$CARCH
	if [ "$CARCH" == "i686" ]; then
		suffix=$pkgver-32bit
	fi

	bsdtar -xf "$srcdir/mouseserver-$suffix.deb"
	# extract data portion
	tar -xf "$srcdir/data.tar.gz"	
}

package() {
	# create destination directories
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
	
	# install files
	install -m 775 "$srcdir/usr/sbin/mouseserver" "$pkgdir/usr/bin"
	install -m 664 "$srcdir/usr/share/applications/mouseserver.desktop" "$pkgdir/usr/share/applications/mouseserver.desktop"
	install -m 664 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mouseserver.png"

	# modify desktop file
	desktopfile="$pkgdir/usr/share/applications/mouseserver.desktop"
	sed -i 's/Exec=.*$/Exec=\/usr\/bin\/mouseserver/'                                       "$desktopfile"
	sed -i 's/Icon=.*$/Icon=\/usr\/share\/icons\/hicolor\/128x128\/apps\/mouseserver.png/' "$desktopfile"
}
