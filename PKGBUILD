# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=telemt
pkgver=3.3.35
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/telemt/telemt/archive/refs/tags/${pkgver}.tar.gz"
		'telemt.toml.sample')

sha256sums=('e244859fdbd2af0b0f70c1afd86533ae6e163210f20672f0ff54a35ec20a4a3e'
            '23823b23d34c74660b8ef10839fa08b2d177407f910f4df5ad4838ff3e8758e3')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	# Binary
	install -Dm755 "target/release/telemt" "${pkgdir}/usr/bin/telemt"

	# Docs/Example configs
	install -Dm644 "${srcdir}/telemt.toml.sample" "${pkgdir}/etc/telemt/telemt.toml.sample"

	# Systemd/Arch integration
	install -Dm644 "contrib/systemd/telemt.service" "${pkgdir}/usr/lib/systemd/system/telemt.service"
	install -Dm644 "contrib/systemd/system-user-telemt.conf" "${pkgdir}/usr/lib/sysusers.d/telemt.conf"
	install -Dm644 "contrib/systemd/tmpfiles-telemt.conf" "${pkgdir}/usr/lib/tmpfiles.d/telemt.conf"

	# License
	install -Dm755 "docs/LICENSE/LICENSE.en.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
