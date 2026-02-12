# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

_dotnetver="10.0"

pkgname=garnet-bin
_pkgname=${pkgname/-bin/}
pkgver=1.0.98 # datasource=github-releases depName=microsoft/garnet
pkgrel=1
pkgdesc='A high-performance cache-store from Microsoft Research'
url='https://microsoft.github.io/garnet'
license=('MIT')
arch=('aarch64' 'x86_64')
options=('!strip')
conflicts=($_pkgname)
provides=($_pkgname)
depends=("dotnet-runtime-${_dotnetver}" "gcc-libs" "glibc" "libaio")

_baseurl="https://github.com/microsoft/${_pkgname}/releases/download/v${pkgver}"
source_aarch64=("garnet-arm64-${pkgver}.tar.xz::${_baseurl}/linux-x64-based.tar.xz")
source_x86_64=("garnet-x64-${pkgver}.tar.xz::${_baseurl}/linux-x64-based.tar.xz")

source=(
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/microsoft/${_pkgname}/refs/tags/v${pkgver}/LICENSE"
	"garnet-server.service"
)

sha256sums=('c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383'
            'a536b51496a330d8faa8f00fea134177d6e48f404663211db876af5adc7e6470')
sha256sums_aarch64=('ec29e7a8a999ebcb21af44c80b512b6f6a2df6683bcfc8e8e03e3ac57c6e8651')
sha256sums_x86_64=('ec29e7a8a999ebcb21af44c80b512b6f6a2df6683bcfc8e8e03e3ac57c6e8651')

package() {

	local garnet_location="$pkgdir/usr/lib/garnet" 

	install -Dm755 "net${_dotnetver}/GarnetServer" -t $garnet_location
	install -Dm644 "net${_dotnetver}/garnet.conf" "$pkgdir/etc/garnet/garnet-server.conf"
	install -Dm644 "net${_dotnetver}/liblua54.so" "net${_dotnetver}/libnative_device.so" -t $garnet_location

	mkdir -p "$pkgdir/usr/bin"
	ln -sr "$pkgdir/usr/lib/garnet/GarnetServer" "$pkgdir/usr/bin/GarnetServer"

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "garnet-server.service"

	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
