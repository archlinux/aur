# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=dae
pkgver=0.5.0
pkgrel=1
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/${pkgname}"
license=('AGPL')
depends=(
	'glibc'
	'v2ray-geoip'
	'v2ray-domain-list-community'
)
makedepends=('clang' 'go')
backup=("etc/${pkgname}/config.${pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname}-full-src.zip")
sha256sums=('2db90b9dc41be16af7b269a985513a4130a7138d732c337dc47c9aac73b2e08b')

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	make VERSION="${pkgver}"
}

package() {
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 "install/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm640 "install/empty.${pkgname}" "${pkgdir}/etc/${pkgname}/config.${pkgname}"
	install -Dm644 "example.${pkgname}" "${pkgdir}/etc/${pkgname}/config.${pkgname}.example"

	mkdir -p "${pkgdir}/usr/share/${pkgname}/"
	ln -vs /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/${pkgname}/geoip.dat"
	ln -vs /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/${pkgname}/geosite.dat"
}
