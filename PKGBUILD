# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=garnet-bin
_pkgname=${pkgname/-bin/}
pkgver=1.0.91 # datasource=github-releases depName=microsoft/garnet
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
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/microsoft/garnet/refs/tags/v${pkgver}/LICENSE"
	"garnet-server.service"
)

sha256sums=('43a5e02093306e4b4d9a82f36e768a2bbbd5ff731082e9435f53916b2f2dc2d7'
            'c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383'
            'a536b51496a330d8faa8f00fea134177d6e48f404663211db876af5adc7e6470')

package() {

	local garnet_location="$pkgdir/usr/lib/garnet" 

	install -Dm755 "net9.0/GarnetServer" -t $garnet_location
	install -Dm644 "net9.0/garnet.conf" "$pkgdir/etc/garnet/garnet-server.conf"
	install -Dm644 "net9.0/liblua54.so" "net9.0/libnative_device.so" -t $garnet_location

	mkdir -p "$pkgdir/usr/bin"
	ln -sr "$pkgdir/usr/lib/garnet/GarnetServer" "$pkgdir/usr/bin/GarnetServer"

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "garnet-server.service"

	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
