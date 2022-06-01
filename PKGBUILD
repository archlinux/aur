# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: SuchBlue

pkgname=salad
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Allows gamers to mine crypto in their downtime."
arch=(x86_64)
url="https://salad.com/"
license=('MIT')
depends=(nodejs)
makedepends=(yarn libxcrypt-compat)
optdepends=()
_repo=$pkgname-applications
source=("$_repo-$pkgver.tar.gz::https://github.com/SaladTechnologies/$_repo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fd347d7a06cff8a2dad1f61233a2ca8fd51b446031331d8ceffefde8249facdf')

prepare() {
	cd "$_repo-$pkgver/packages/desktop-app"
	# Someone at salad forgot to update the version in the package.json lol
	sed -i 's/^  "version": "0.5.8",$/  "version": "1.0.0",/' package.json
	sed -i 's/^    "build-installer": "electron-builder",$/    "build-installer": "electron-builder --linux pacman",/' \
		package.json
	yarn install
	yarn run lint
}

build() {
	cd "$_repo-$pkgver/packages/desktop-app"
	yarn run build-app
	yarn run build-installer
}

package() {
	cd "$_repo-$pkgver/packages/desktop-app/dist/app"
	tar xf "Salad-${pkgver}.pacman" --directory="${pkgdir}"
	rm "${pkgdir}/.MTREE"
	rm "${pkgdir}/.INSTALL"
	rm "${pkgdir}/.PKGINFO"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/Salad/salad" "${pkgdir}/usr/bin/salad"
}
