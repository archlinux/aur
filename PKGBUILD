# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=pomerium-bin
pkgname=(pomerium-bin pomerium-cli-bin)
pkgver=0.15.6
pkgrel=1
pkgdesc='An identity-aware access proxy'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.pomerium.io'
license=('Apache')
source=('pomerium.sysusers')
source_x86_64=("pomerium-server-${pkgver}-x86_64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_amd64.deb"
               "pomerium-cli-${pkgver}-x86_64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("pomerium-cli-${pkgver}-armv6h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("pomerium-cli-${pkgver}-armv7h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("pomerium-server-${pkgver}-aarch64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_arm64.deb"
               "pomerium-cli-${pkgver}-aarch64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums=('36b44da89f922a8017d5b26ac6fd71215e4d82525d94161f999aba6e223fd111')
sha256sums_x86_64=('41c9ff26bc93c4731046cee49059bc3209ae29aceb5f8f55fa54e9214f5cc989'
                   'd09f388686fb0402326151713ed0e1570f79601f1a22c9e7f188b83c873ec234')
sha256sums_armv6h=('d8a7b542f45517fd5065432ad39e50ff5b2e35bc454c366f381b3e0f1ba4ef04')
sha256sums_armv7h=('a39432bcf6e260eee2dcb2425e590c9fd527e6026abc4f39b98954c714d29385')
sha256sums_aarch64=('8a34c5f4fe2448c6fbaaa1fa65b0c17eaedbcb99918749c3e6ecb0916cf2ba29'
                    'efed67b9b4487b121780d32cbd2e2f7415aa7acad717d657dd857ac629c45105')

prepare() {
	mkdir dump
	bsdtar xf data.tar.gz -C dump
}

package_pomerium-bin() {
	pkgdesc+=' -- server component'
	arch=('x86_64' 'aarch64')
	provides=('pomerium')
	conflicts=('pomerium')
	backup=('etc/pomerium/config.yaml')
	optdepends=('pomerium-cli: CLI component for interacting with server')

	install -Dm 644 pomerium.sysusers "$pkgdir/usr/lib/sysusers.d/pomerium.conf"

	cd dump
	install -D usr/sbin/pomerium -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/lib/systemd/system/pomerium.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 etc/pomerium/config.yaml -t "$pkgdir/etc/pomerium/"
}

package_pomerium-cli-bin() {
	pkgdesc+=' -- CLI component'
	provides=('pomerium-cli')
	conflicts=('pomerium-cli')

	install -D pomerium-cli -t "$pkgdir/usr/bin/"
}
