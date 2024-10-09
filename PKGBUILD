# Maintainer: Chi_Tang <me@chitang.dev>
# Contributor: Nekoray_CI <noreply@chitang.dev>
pkgname='nekoray-git'
pkgver=4.0.beta3.r6.g12d6fc2
pkgrel=1
pkgdesc='Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)'
arch=('x86_64')
url='https://matsuridayo.github.io'
license=('GPL')
makedepends=('cmake' 'git' 'ninja' 'go' 'zxing-cpp')
depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'protobuf' 'yaml-cpp' 'sing-geoip' 'sing-geosite')

source=(
	'git+https://github.com/MatsuriDayo/nekoray.git'
	'nekoray.desktop'
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/nekoray"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/nekoray"
	git submodule init
	git submodule update
	bash libs/get_source.sh
	mkdir -p build
	cd build
	cmake -GNinja -DQT_VERSION_MAJOR=5 -DNKR_PACKAGE=ON ..
	ninja
	cd "${srcdir}/nekoray"
	GOOS=linux GOARCH=amd64 ./libs/build_go.sh
}

package() {
	mkdir -p "${pkgdir}/usr/lib/nekobox"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	# assets
	cp "${srcdir}/nekoray.desktop" "${pkgdir}/usr/share/applications/nekoray.desktop"
	cp -a "${srcdir}/nekoray/res/public/nekobox.png" "${pkgdir}/usr/lib/nekobox/"
	ln -s "/usr/lib/nekobox/nekobox.png" "${pkgdir}/usr/share/pixmaps/nekobox.png"
	# core	
	cp -a "${srcdir}/nekoray/deployment/linux64/nekobox_core" "${pkgdir}/usr/lib/nekobox/"
	# app
	cp -a "${srcdir}/nekoray/build/nekobox" "${pkgdir}/usr/lib/nekobox/"
	ln -s  "/usr/lib/nekobox/nekobox" "${pkgdir}/usr/bin/nekobox"
}
