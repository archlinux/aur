# Maintainer: Rajnish Mishra <contact.rajnishmishra@gmail.com>

pkgname=raspmgr
_pkgname=Rasp-Manager
pkgver=2.0.3
pkgrel=2
pkgdesc="A simple server manager for local network (especially for Raspberry Pi)"
arch=('any')
url="https://github.com/PiyushXCoder/${_pkgname}"
license=('GPL3')
makedepends=('git' 'cargo')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/PiyushXCoder/${_pkgname}/archive/V${pkgver}.tar.gz")
sha256sums=('76df28aa278424420914737567085a358eddbbe23840103e72d59f2749d26838')

prepare() {
	cd "${_pkgname}-${pkgver}"
	sed -i 's/port = 8080/port = 80/g;s/\".\/static\"/\"\/var\/lib\/rasp_mgr\/static\"/g' Config.toml
}

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm755 "target/release/rasp_mgr" "${pkgdir}/usr/bin/rasp_mgr"
	install -Dm644 "Config.toml" "${pkgdir}/etc/rasp_mgr/Config.toml"
	install -Dm644 "rasp_mgr.service" "${pkgdir}/usr/lib/systemd/system/rasp_mgr.service"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/rasp_mgr/LICENSE"
	mkdir -p "${pkgdir}/var/lib/rasp_mgr/"
	cp -r "static" "${pkgdir}/var/lib/rasp_mgr/"
}
