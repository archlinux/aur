# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

_author=olrtg
pkgname=emmet-language-server
pkgver=2.7.0  # datasource=npm depName=@olrtg/emmet-language-server
pkgrel=2
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")

source=(
	"https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/${_author}/${pkgname}/refs/tags/v${pkgver}/LICENSE"
)
noextract=("${pkgname}-${pkgver}.tgz")

sha256sums=('a654869a65a3a0ef8c04554e005bf6695c34f83e8e69452303be9fb3be100ea9'
            'b6f2eebb6983c993a6e12614cc806838de3835ce8931e9f08e3538ee89ada3f1')

package() {

	npm install -g --legacy-peer-deps --prefix "$pkgdir/usr" "$srcdir/${pkgname}-${pkgver}.tgz"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
