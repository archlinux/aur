# Maintainer: Sir-Photch <sir-photch at posteo dot me>

pkgname=spinnaker-sdk
_pkgname=spinnaker
pkgdesc="The Spinnaker SDK is Teledyne’s next-generation GenICam3 API library for machine vision developers."
pkgver=4.0.0.116
pkgrel=1
provides=(libgentl libspinnaker libspinnaker-dev libspinnaker-c libspinnaker-c-dev libspinvideo libspinvideo-dev libspinvideo-c libspinvideo-c-dev spinnaker spinnaker-doc spinupdate spinupdate-dev spinview-qt spinview-qt-dev)
conflicts=(libgentl libspinnaker libspinnaker-dev libspinnaker-c libspinnaker-c-dev libspinvideo libspinvideo-dev libspinvideo-c libspinvideo-c-dev spinnaker spinnaker-doc spinupdate spinupdate-dev spinview-qt spinview-qt-dev)
arch=(x86_64)
license=(custom)
url="https://www.flir.com/products/spinnaker-sdk/"
depends=('libusb' 'qt5-base' 'qt5-tools' 'ffmpeg4.4')

_dir="$_pkgname-$pkgver-amd64"
source=(
	"$pkgname-$pkgver.tar.gz::https://flir.netx.net/file/asset/59513/original/attachment"
	"$_pkgname-usbfs.service"
	"$_pkgname.rules"
	"$_pkgname-gentl-64.sh"
	"$_pkgname-paths.sh"
)
sha512sums=('40fd7f8c2c1f580fc9172244891f6299b78a53622eb14c2e30d9136c7fce121b9a004b6f2cfead361b9b253381cf06ccb285497d2701e0bf0d1071e3d755adf7'
            '3acc73e43a0a244649ef3e299129b40f16edef29a8c4b9e7330fb7cebefc8a305ebf41ccb39e19998a042ddd104ccae33ad7bc8c350a23f47648029642bba65d'
            '070afc466d49354bf92ca492f7621c038b968f583b4a98915f4b97b899d090ac398ffcb7b4a63c16d3ef81fdf2c404a7c00b24a8d91df4e686f510f5014c1508'
            'fd7c209001eeb8c289d50b951a824c7adb36847582aa95ecd11f3a71749900c1d3184cf152508eac1e35ae11754621c188fd47bf87b62753454008baf1c3ac76'
            '90849c0f74b1ccbebf715d9064b93c5d2a3b1858960799216d05fc8a0606615e583e1dde8b724d34c015ffa08f1e057ed1327f0d5fb997a811bb51991eba2a12')

prepare() {
	cd "$srcdir/$_dir"

	for deb in *.deb; do
		local xdir="$(basename "$deb" .deb)"
		mkdir -p "$xdir"
		ar x "$deb" --output "$xdir"
	done
}

package() {
	cd "$srcdir/$_dir"

	for tarball in **/data.tar.zst; do
		tar xf "$tarball" --directory="$pkgdir"
	done

	install -Dm 644 "$pkgdir/etc/ld.so.conf.d/libspinnaker.conf" "$pkgdir/usr/lib/ld.so.conf.d/$_pkgname.conf"
	rm -rf "$pkgdir/etc/ld.so.conf.d"

	install -Dm 644 "$srcdir/$_pkgname-usbfs.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/$_pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/40-$_pkgname.rules"
	install -Dm 644 "$srcdir/$_pkgname"-*.sh -t "$pkgdir/etc/profile.d"
}
