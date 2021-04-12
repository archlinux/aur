# Maintainer: Cleber Matheus <clebermatheus@outlook.com>

pkgname=vpncloud
pkgver=2.2.0
pkgrel=1
pkgdesc='Peer-to-peer VPN'
arch=('x86_64')
url="https://vpncloud.ddswd.de/"
license=('GPL')
groups=()
makedepends=('rust' 'cargo' 'git' 'asciidoctor')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/dswd/vpncloud/archive/refs/tags/v${pkgver}.tar.gz
		vpncloud@.service)
backup=(etc/vpncloud/example.net.disabled)
noextract=()
sha256sums=('a53a320105563597fabdfba5e623afe86d10a1e1c9c967da8f8ac6ea155a2919'
            '5f6bc9bd69535ed4c7786cfc6b385ab1c01cffafa4f57d34619247b225c4f13f')

prepare() {
        cd ${pkgname}-${pkgver}
}

build() {
        cd ${pkgname}-${pkgver}

        cargo build --release
}

package() {
        cd ${pkgname}-${pkgver}

	install -Dt "${pkgdir}"/usr/bin -m0755 target/release/vpncloud

	install -Dt "${pkgdir}"/etc/vpncloud -Dm0644 assets/example.net.disabled
	install -Dt "${pkgdir}"/usr/share/man/man1 target/vpncloud.1.gz
	install -Dt "${pkgdir}"/usr/share/licenses/vpncloud -m0644 LICENSE.md
	install -Dt "${pkgdir}"/usr/share/doc/vpncloud -m0644 README.md assets/changelog.txt

	install -Dm644 "../vpncloud@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
