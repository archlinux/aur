# Maintainer: <abishekj274@gmail.com>
pkgname=salad-git
pkgver=0.5.8.r50.g6da8d38e
pkgrel=1
pkgdesc="Allows gamers to mine crypto in their downtime [git version]."
arch=(x86_64)
url="https://salad.com"
license=("MIT")
depends=("nodejs" "libxcrypt-compat" "nss" "gtk3" "alsa-lib")
makedepends=("yarn" "git")
optdepends=()
source=("git+https://github.com/SaladTechnologies/salad-applications.git")
sha256sums=('SKIP')
conflicts=("salad")
provides=("salad")

pkgver() {
	cd "${srcdir}/salad-applications"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_sldver=$(echo $pkgver | sed 's/[r].*//' | sed 's/.$//')

prepare() {
	cd "salad-applications/packages/desktop-app"
	sed -i 's/: "electron-builder/: "electron-builder --linux pacman/g' package.json	
}

build() {
	cd "salad-applications/packages/desktop-app"	
	yarn install
	yarn run lint
	yarn run build-app
	yarn run build-installer
}


package() {
	cd "salad-applications/packages/desktop-app/dist/app"
	tar xf "Salad-${_sldver}.pacman" --directory="${pkgdir}"
	rm "${pkgdir}/.MTREE"
	rm "${pkgdir}/.INSTALL"
	rm "${pkgdir}/.PKGINFO"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/Salad/salad" "${pkgdir}/usr/bin/salad"
	install -Dm644 "${srcdir}/salad-applications/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


