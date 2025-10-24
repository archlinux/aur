# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-cli
pkgver=4.1.16 # datasource=npm depName=@tailwindcss/cli
pkgrel=1
pkgdesc='A utility-first CSS framework for rapidly building custom user interfaces.'
arch=('any')
url='https://tailwindcss.com'
license=('MIT')
depends=('nodejs' 'gcc-libs' 'glibc')
makedepends=('npm')
provides=('tailwindcss')

source=("https://registry.npmjs.org/@tailwindcss/cli/-/cli-${pkgver}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/tailwindlabs/tailwindcss/refs/tags/v${pkgver}/LICENSE")

noextract=("cli-${pkgver}.tgz")

sha256sums=('2e4b18d55f54728093971fe5a474a2f5518a9d0df4d9a2b347a7b7d2d5cd31c6'
            '60e0b68c0f35c078eef3a5d29419d0b03ff84ec1df9c3f9d6e39a519a5ae7985')

package() {

	npm install -g --legacy-peer-deps --prefix "$pkgdir/usr" "$srcdir/cli-${pkgver}.tgz"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
