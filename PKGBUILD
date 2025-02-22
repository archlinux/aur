# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=garnet-bin
_pkgname=${pkgname/-bin/}
pkgver=1.0.57
pkgrel=1
pkgdesc='A high-performance cache-store from Microsoft Research'
url='https://microsoft.github.io/garnet'
license=('MIT')
arch=('x86_64')
options=('!strip')
conflicts=($_pkgname)
provides=($_pkgname)
depends=("dotnet-runtime-8.0" "gcc-libs" "glibc" "libaio")

source=(
	"garnet-${pkgver}.tar.xz::https://github.com/microsoft/${_pkgname}/releases/download/v${pkgver}/linux-x64-based.tar.xz"
	"garnet-server.service::https://aur.archlinux.org/cgit/aur.git/plain/garnet-server.service?h=garnet" # jiri.pospisil's service
	"https://raw.githubusercontent.com/microsoft/garnet/refs/heads/main/LICENSE"
)

sha256sums=('cb954f9b150f919f2f8e2dfee9bc0b7f73229b89858c8ce14c50ce810da9ad52'
            '0c16f0124c3c962e4fac1241cc1b1d86f61600758a4ff3846cd00a580e76cfdf'
            'c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')

package() {

	local garnet_location="$pkgdir/usr/lib/garnet" 

	install -Dm755 "GarnetServer" -t $garnet_location
	install -Dm644 "garnet.conf" "$pkgdir/etc/garnet/garnet-server.conf"
	install -Dm644 "liblua54.so" "libnative_device.so" -t $garnet_location

	mkdir -p "$pkgdir/usr/bin"
	ln -sr "$pkgdir/usr/lib/garnet/GarnetServer" "$pkgdir/usr/bin/GarnetServer"

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "garnet-server.service"

	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
