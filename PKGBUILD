# Maintainer: leo <douglarek at gmail dot com>
pkgname=daea
pkgver=0.5.1
pkgrel=1
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/dae"
license=('AGPL')
depends=('glibc')
makedepends=('clang' 'go')
backup=("etc/dae/config.dae")
source=(
	"dae-${pkgver}.zip::${url}/releases/download/v${pkgver}/dae-full-src.zip"
	"geoip.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
	"geosite.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
)
sha256sums=(
	'aad00888f7f3e8fae916297fede68d067894b5534148d261122bde2e7bba0b98'
	'SKIP'
	'SKIP'
)

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	make VERSION="${pkgver}"
}

package() {
	install -Dm755 "dae" -t "${pkgdir}/usr/bin/"
	install -Dm644 "install/dae.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm640 "install/empty.dae" "${pkgdir}/etc/dae/config.dae"
	install -Dm644 "example.dae" "${pkgdir}/etc/dae/config.dae.example"

	mkdir -p "${pkgdir}/usr/share/dae/"
	cp geoip.dat "${pkgdir}/usr/share/dae/geoip.dat"
	cp geosite.dat "${pkgdir}/usr/share/dae/geosite.dat"
}
