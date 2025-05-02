# Maintainer: skynet2077 <fancykittens at gmx dot com>
# Contributor: Oleksandr Natalenko <oleksandr at natalenko dot name>
# Contributor: gryffyn <evanmicahp at gmail dot com>

pkgname=encrypted-dns
pkgver=0.9.17
pkgrel=1
pkgdesc="A modern encrypted DNS server (DNSCrypt v2, Anonymized DNSCrypt, DoH)"
url="https://github.com/DNSCrypt/encrypted-dns-server"
license=(MIT)
arch=(x86_64 aarch64)
makedepends=(rust cargo make)
options=(!lto)
backup=(var/lib/${pkgname}/${pkgname}.toml)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/DNSCrypt/encrypted-dns-server/archive/refs/tags/${pkgver}.tar.gz
	$pkgname.service
	$pkgname-sysusers.conf
	$pkgname-tmpfiles.conf)
sha256sums=('ed3b2bde825d2b2c8f6db3fc7d964c39956cb826054279498d7ae7c7b27bb47e'
            '5f819e7faa3c8775f62fd2fa23d3d2e85de223015111a67e11e3e46ee9d6f7c1'
            '158f60a15356ec45aed4c27a0264d8520969f8aa19b2117f7e969c958f71c502'
            '2981c6e78d272e404a51a19155ed9158321079ffc3d9de58750767e5b9159e6d')

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd ${pkgname}-server-${pkgver}

	sed -i 's|state_file = "encrypted-dns.state"|state_file = "/var/lib/encrypted-dns/encrypted-dns.state"|' example-encrypted-dns.toml
	sed -i 's|# domain_blacklist = "/etc/domain_blacklist.txt"|# domain_blacklist = "/var/lib/encrypted-dns/domain_blacklist.txt"|' example-encrypted-dns.toml
	sed -i 's|# undelegated_list = "/etc/undelegated.txt"|# undelegated_list = "/var/lib/encrypted-dns/undelegated.txt"|' example-encrypted-dns.toml
	sed -i 's|blacklisted_ips = \[ "93.184.216.34" \]|blacklisted_ips = \[ \]|' example-encrypted-dns.toml
}

build() {
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	export CARGO_HOME=${srcdir}/.cargo

	cd ${pkgname}-server-${pkgver}

	cargo build --release --all-features
	strip target/release/${pkgname}
}

package() {
	install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "${pkgname}-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "${pkgname}-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	cd ${pkgname}-server-${pkgver}

	install -Dm755 -t "${pkgdir}"/usr/bin target/release/encrypted-dns
	install -Dm644 -t "${pkgdir}"/usr/share/licenses/encrypted-dns LICENSE
	install -Dm644 -t "${pkgdir}"/usr/share/doc/encrypted-dns README.md dashboard.png logo.png

	install -Dm644 example-encrypted-dns.toml "${pkgdir}"/var/lib/${pkgname}/encrypted-dns.toml
	install -Dm644 undelegated.txt "${pkgdir}"/var/lib/encrypted-dns
	touch "${pkgdir}"/var/lib/${pkgname}/domain_blacklist.txt
}
