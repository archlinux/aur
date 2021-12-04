# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: SuchBlue
pkgname=salad
pkgver=0.5.8
pkgrel=1
epoch=
pkgdesc="Allows gamers to mine crypto in their downtime."
arch=(x86_64)
url="https://salad.com/"
license=('MIT')
depends=(nodejs)
makedepends=(yarn)
optdepends=()
source=("https://github.com/SaladTechnologies/salad-applications/archive/refs/tags/${pkgver}.zip")
sha256sums=('41f6c033c5e1e4950de8c080e2142df741bf033d3d9782f32e9e96cf9a0216f4')

prepare() {
	cd "salad-applications-${pkgver}/packages/desktop-app"
	sed -i 's/: "electron-builder/: "electron-builder --linux pacman/g' package.json	
}

build() {
	cd "salad-applications-${pkgver}/packages/desktop-app"	
	yarn install
	yarn run lint
	yarn run build-app
	yarn run build-installer
}

package() {
	cd "salad-applications-${pkgver}/packages/desktop-app/dist/app"
	tar xf "Salad-${pkgver}.pacman" --directory="${pkgdir}"
	rm "${pkgdir}/.MTREE"
	rm "${pkgdir}/.INSTALL"
	rm "${pkgdir}/.PKGINFO"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/Salad/salad" "${pkgdir}/usr/bin/salad"
}
