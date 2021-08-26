# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=pomerium-bin
pkgname=(pomerium-bin pomerium-cli-bin)
pkgver=0.15.1
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
sha256sums_x86_64=('75e89b4e54a6a274b26d55bfed00a4af743ea2f87a4a36d69666822326048199'
                   'd8041e7f625de371d71b79a041483de56db81012d377982e5233095cd5811db6')
sha256sums_armv6h=('6dbb57168f66f8d6d3ab3837a46e5bdfa1d286ff82be89064a41c25a5f4847f7')
sha256sums_armv7h=('1140ee54246b4844c96a4f0d0a67728fc918e95865a51459d7a527bd4d7ee32d')
sha256sums_aarch64=('5aaca6174bbf8ac5b3b9dcef5d1639e5c961d4b9bacf4374fdf7d91af170230b'
                    '8e973249919ed80b6d986cf741e044f8da4b12682cafb408254ee614daf13f41')

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
	install -Dm 755 usr/sbin/pomerium -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/lib/systemd/system/pomerium.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 etc/pomerium/config.yaml -t "$pkgdir/etc/pomerium/"
}

package_pomerium-cli-bin() {
	pkgdesc+=' -- CLI component'
	provides=('pomerium-cli')
	conflicts=('pomerium-cli')

	install -Dm 755 pomerium-cli -t "$pkgdir/usr/bin/"
}
