# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=garnet-bin
_pkgname=${pkgname/-bin/}
pkgver=1.0.74 # datasource=github-releases depName=microsoft/garnet
pkgrel=1
pkgdesc='A high-performance cache-store from Microsoft Research'
url='https://microsoft.github.io/garnet'
license=('MIT')
arch=('x86_64')
options=('!strip')
conflicts=($_pkgname)
provides=($_pkgname)
depends=("dotnet-runtime-9.0" "gcc-libs" "glibc" "libaio")

source=(
	"garnet-${pkgver}.tar.xz::https://github.com/microsoft/${_pkgname}/releases/download/v${pkgver}/linux-x64-based.tar.xz"
	"garnet-server.service::https://aur.archlinux.org/cgit/aur.git/plain/garnet-server.service?h=garnet" # jiri.pospisil's service
	"https://raw.githubusercontent.com/microsoft/garnet/refs/tags/v${pkgver}/LICENSE"
)

sha256sums=('fe4ca7767081bf48156929da7480e9baf4d25283007a89a6239ab9c23cbb16b1'
            '0c16f0124c3c962e4fac1241cc1b1d86f61600758a4ff3846cd00a580e76cfdf'
            'c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')

package() {

	local garnet_location="$pkgdir/usr/lib/garnet" 

	install -Dm755 "net9.0/GarnetServer" -t $garnet_location
	install -Dm644 "net9.0/garnet.conf" "$pkgdir/etc/garnet/garnet-server.conf"
	install -Dm644 "net9.0/liblua54.so" "net9.0/libnative_device.so" -t $garnet_location

	mkdir -p "$pkgdir/usr/bin"
	ln -sr "$pkgdir/usr/lib/garnet/GarnetServer" "$pkgdir/usr/bin/GarnetServer"

	sed -ie "s/network-online/network/g" "garnet-server.service"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "garnet-server.service"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
