# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=pomerium-bin
pkgname=(pomerium-bin pomerium-cli-bin)
pkgver=0.15.2
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
sha256sums_x86_64=('4393bf776ee0daeeb8c3a8c2b2da62868fa9862dfee5958b2b095a52a1c22fa8'
                   'ab96c160f50e4f45962195f098273c83e5e58a3968e20f1c3807a218af5b584e')
sha256sums_armv6h=('bf041690f4377beacaa9a4e3468498ebb42c1f48ef35572188e9eaba009d464e')
sha256sums_armv7h=('c41b053b3fc4975c93f5c5e8a15a5837e6f521e4a063f678294fd86f604924d1')
sha256sums_aarch64=('f7e96d53b1ec3461e9036535a8f651d5b36d76e771e8f4950d8e3d9fd9a44c41'
                    'd2ded80b56b014a20a55832dec7ff5f44cbdc5cb158d00e26bc4411cb01b5feb')

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
