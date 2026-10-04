# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=telemt
pkgver=3.5.13
pkgrel=1
pkgdesc='Telemt - MTProxy on Rust + Tokio'
arch=('x86_64' 'aarch64')
provides=("telemt")
url='https://github.com/telemt/telemt'
license=('custom:TELEMT Public License 3')
makedepends=('cargo')
optdepends=('nginx: when using nginx as reverse proxy'
			'caddy: when using caddy as reverse proxy')
backup=('etc/telemt/telemt.toml')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telemt/telemt/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('a03adb7f3571cb18e958788b1fc418c95c3206eb959ec55e6325c8dad2c9f5bc')

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
	install -Dm755 "docs/LICENSE/TELEMT-LICENSE.en.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
