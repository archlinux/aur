# Maintainer: Roni Hokkanen <roni dot hokkanen at protonmail dot com>

pkgname=zephyr-node-bin
pkgver=2.0.1
tagver=2.0.0 # This can be different than pkgver if the Github release tag doesn't match the actual version number of the archives
pkgrel=1
pkgdesc="This package provides the Zephyr protocol node software and a cli wallet."
arch=('x86_64')
url='https://github.com/ZephyrProtocol/zephyr'
#TODO: Add dependencies and maybe add the license from Zephyr's git repo
license=('custom:Monero')
makedepends=('curl' 'unzip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
	"zephyr-node.service"
	"zephyr-node-on-demand.service"
	"zephyr-node-proxy.service"
	"zephyr-node-proxy.socket"
)

prepare() {
	if ! [ -f zephyr-cli-linux-v${pkgver}.zip ]; then
		echo "Downloading https://github.com/ZephyrProtocol/zephyr/releases/download/v${tagver}/zephyr-cli-linux-v${pkgver}.zip"
		curl -LO "https://github.com/ZephyrProtocol/zephyr/releases/download/v${tagver}/zephyr-cli-linux-v${pkgver}.zip"
		unzip "./zephyr-cli-linux-v${pkgver}.zip"
	fi
}

package() {
	install -Dm755 "${srcdir}/zephyr-cli-linux-v${pkgver}/zephyrd" "${pkgdir}/usr/bin/zephyrd"
	install -Dm755 "${srcdir}/zephyr-cli-linux-v${pkgver}/zephyr-wallet-cli" "${pkgdir}/usr/bin/zephyr-wallet-cli"
	install -Dm755 "${srcdir}/zephyr-cli-linux-v${pkgver}/zephyr-wallet-rpc" "${pkgdir}/usr/bin/zephyr-wallet-rpc"
	install -Dm644 "${srcdir}/zephyr-node.service" "${pkgdir}/usr/lib/systemd/user/zephyr-node.service"
	install -Dm644 "${srcdir}/zephyr-node-on-demand.service" "${pkgdir}/usr/lib/systemd/user/zephyr-node-on-demand.service"
	install -Dm644 "${srcdir}/zephyr-node-proxy.service" "${pkgdir}/usr/lib/systemd/user/zephyr-node-proxy.service"
	install -Dm644 "${srcdir}/zephyr-node-proxy.socket" "${pkgdir}/usr/lib/systemd/user/zephyr-node-proxy.socket"
	# A service that shuts the node down when not in use should be added
	# Otherwise the on demand starting is pretty useless
}

md5sums=('d6158cac6dc7552f7c3e864f2e158021'
	'd9765fb9192464798806ee36d2cd46b4'
	'5327ef74c270df1d11a6f453da76f126'
	'f764c67dbf2525f602af9eb7d69ec799')
