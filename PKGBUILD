# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=spinnaker-sdk
_pkgname=spinnaker
pkgdesc="Teledyne’s next-generation GenICam3 API library for machine vision developers"
pkgver=4.2.0.88
pkgrel=1
provides=(libgentl libspinnaker libspinnaker-dev libspinnaker-c libspinnaker-c-dev libspinvideo libspinvideo-dev libspinvideo-c libspinvideo-c-dev spinnaker spinnaker-doc spinupdate spinupdate-dev spinview-qt spinview-qt-dev)
conflicts=(libgentl libspinnaker libspinnaker-dev libspinnaker-c libspinnaker-c-dev libspinvideo libspinvideo-dev libspinvideo-c libspinvideo-c-dev spinnaker spinnaker-doc spinupdate spinupdate-dev spinview-qt spinview-qt-dev)
arch=(x86_64)
license=(custom)
url="https://www.flir.com/products/spinnaker-sdk/"
depends=('libusb' 'qt5-base' 'qt5-tools' 'ffmpeg4.4')

_dir="$_pkgname-$pkgver-amd64"
source=(
	"$pkgname-$pkgver.tar.gz::https://flir.netx.net/file/asset/71711/original/attachment"
	"$_pkgname-usbfs.service"
	"$_pkgname.rules"
	"$_pkgname-gentl-64.sh"
	"$_pkgname-paths.sh"
)
b2sums=('f0a75ac5afacfd2e4ed7befcc86e04a0af29865d5ee6f559af8869c8a5e460c7f4368a7d21c0f66c0d8d9ec35013024ea7dcf4b7e96885ebf22553b94837ceb2'
        'bd3fd6855a868a6839cc77537a1fa9a537ba0d63c874ed1a973417cd98a56a363cb66c8a47d12fbab324e84a627077e2a37154e9fbb7c8a56df3b8bcd0f3dfaa'
        'a449e038db08db9da143ea37c6a6072baa2cb3f0d0b343bcdf1c027ac023ca7019779338a2c5f0d8af5547baff3743983eae5b8c2e581ba508cd126ce18cfa30'
        '38b44ae16e9542496bb3b3dae5a297234ed96f8929783b5663a775406eeeee5a3b0b17734a54803e81d878b3f4d3d7d5b876dcd204f618ece5a6b2f0d3d5b708'
        '015136fabeb9e89fed4252feeba2207f3fb21ec8332f5ee1ea263f217cd499a3ab66974f22dc080c60f8a5bae5bd7b114153e681d0c4e5e99f86f69a8d626aaf')

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
