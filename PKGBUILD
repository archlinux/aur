# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=telemt
pkgver=3.3.38
pkgrel=1
pkgdesc='Telemt - MTProxy on Rust + Tokio'
arch=('x86_64' 'aarch64')
url='https://github.com/telemt/telemt'
license=('custom:TELEMT Public License 3')
makedepends=('cargo')
optdepends=('nginx: when using nginx as reverse proxy'
			'caddy: when using caddy as reverse proxy')
backup=('etc/telemt/telemt.toml')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telemt/telemt/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('5635efd62fa689155d40413cd7a8a74804e03a2af218e72e4f230fa9c884a57c')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	# Binary
	install -Dm755 "target/release/telemt" "${pkgdir}/usr/bin/telemt"

	# Docs/Example configs
	install -Dm644 "config.toml" "${pkgdir}/etc/telemt/telemt.toml.sample"

	# Systemd/Arch integration
	install -Dm644 "contrib/systemd/telemt.service" "${pkgdir}/usr/lib/systemd/system/telemt.service"
	install -Dm644 "contrib/systemd/system-user-telemt.conf" "${pkgdir}/usr/lib/sysusers.d/telemt.conf"
	install -Dm644 "contrib/systemd/tmpfiles-telemt.conf" "${pkgdir}/usr/lib/tmpfiles.d/telemt.conf"

	# License
	install -Dm755 "docs/LICENSE/LICENSE.en.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
