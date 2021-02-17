# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hsd
pkgname=hsd
pkgver=2.3.0
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Handshake Daemon & Full Node"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'npm'
	'node-gyp'
)
provides=(
	'hsd'
	'hsd-node'
	'hsd-spvnode'
	'hs-seeder'
	'hs-wallet'
	'hsd-cli'
	'hsw-cli'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'7b1115251aaec64edc49d0d7a0a50640b4ffb664027f3ec148be62c0eeaf7fc6'
	'SKIP'
)
validpgpkeys=('B4B1F62DBAC084E333F3A04A8962AB9DE6666BBD')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
	tar czf ../package.tar.gz .
	npm install --offline -g --user root --prefix "${pkgdir}"/usr --production ../package.tar.gz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
