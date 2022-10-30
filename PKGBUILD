# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: SuchBlue

pkgname=salad
pkgver=0.5.8
pkgrel=1
epoch=1
pkgdesc='Allows gamers to mine crypto in their downtime.'
arch=(x86_64)
url='https://salad.com/'
license=('MIT')
depends=('nodejs>=16.0.0')
makedepends=(yarn libxcrypt-compat)
optdepends=()
_repo=$pkgname-applications
source=("$_repo-$pkgver.tar.gz::https://github.com/SaladTechnologies/$_repo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6e61a5d0f1cc3565ad435fa9d538595f1c4621cd07e49867f8ecd4d6794343a2')

prepare() {
	cd "$srcdir/$_repo-$pkgver/packages/desktop-app"
	sed -i 's/^    "build-installer": "electron-builder",$/    "build-installer": "electron-builder --linux pacman",/' \
		package.json
	yarn install
	yarn run lint
}

build() {
	cd "$srcdir/$_repo-$pkgver/packages/desktop-app"
	yarn run build-app
	yarn run build-installer
}

package() {
	cd "$srcdir/$_repo-$pkgver/packages/desktop-app/dist/app"
	tar xf "Salad-${pkgver}.pacman" --directory="${pkgdir}"
	rm "${pkgdir}/.MTREE"
	rm "${pkgdir}/.INSTALL"
	rm "${pkgdir}/.PKGINFO"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s '/opt/Salad/salad' "${pkgdir}/usr/bin/salad"
}
