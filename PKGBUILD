# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=telemt
pkgver=3.3.8
pkgrel=1
pkgdesc='Telemt - MTProxy on Rust + Tokio'
arch=('x86_64' 'aarch64')
url='https://github.com/telemt/telemt'
license=('custom:TELEMT UL 1')
makedepends=('cargo')
optdepends=('nginx: when using nginx as reverse proxy'
			'caddy: when using caddy as reverse proxy')
backup=('etc/telemt/telemt.toml')
options=('!lto')
source=("${pkgname}-${pkgver}::git+https://github.com/telemt/telemt#tag=$pkgver"
		"system-user-telemt.conf"
		"telemt.service"
		"tmpfiles-telemt.conf")

sha256sums=('61862bfa43982db366f957979b57b011f1ee6ce0fb2061b6e36ab9933314f046'
            '24a9a6c5804d970753641643eaa8f4514886892f3e415cf06fe6d693cda353fb'
            '5f0c01dd2395bae6fdb86dd84dc4db5c677b339627b46abd3ca7549c92305bf0'
            '2caa1b711c8d16cbdb4276bde9160b113f4c0e4d360953b14aa464a55bfa7a3b')

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
	install -Dm644 "${srcdir}/telemt.service" "${pkgdir}/usr/lib/systemd/system/telemt.service"
	install -Dm644 "${srcdir}/system-user-telemt.conf" "${pkgdir}/usr/lib/sysusers.d/telemt.conf"
	install -Dm644 "${srcdir}/tmpfiles-telemt.conf" "${pkgdir}/usr/lib/tmpfiles.d/telemt.conf"

	# License
	install -Dm755 "LICENSING.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
