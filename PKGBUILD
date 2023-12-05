# Maintainer: Chi_Tang <me@chitang.dev>
# Contributor: Nekoray_CI <noreply@chitang.dev>
pkgname='nekoray-git'
pkgver=3.25.r1.g1b078a8
pkgrel=1
pkgdesc='Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)'
arch=('x86_64')
url='https://matsuridayo.github.io'
license=('GPL')
makedepends=('cmake' 'git' 'ninja' 'go' 'zxing-cpp')
depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'protobuf' 'yaml-cpp')

optdepends=(
	'v2ray-domain-list-community: geosite data for NekoRay'
	'v2ray-geoip: geoip data for NekoRay'
	# AUR
	'sing-geoip: geoip data for NekoBox'
	'sing-geosite: geosite data for NekoBox'
)

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
	mkdir -p "${pkgdir}/usr/lib/nekoray"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	# assets
	cp "${srcdir}/nekoray.desktop" "${pkgdir}/usr/share/applications/nekoray.desktop"
	cp -a "${srcdir}/nekoray/res/public/nekoray.png" "${pkgdir}/usr/lib/nekoray/"
	cp -a "${srcdir}/nekoray/res/public/nekobox.png" "${pkgdir}/usr/lib/nekoray/"
	ln -s "/usr/lib/nekoray/nekoray.png" "${pkgdir}/usr/share/pixmaps/nekoray.png"
	ln -s "/usr/lib/nekoray/nekobox.png" "${pkgdir}/usr/share/pixmaps/nekobox.png"
	# core
	cp -a "${srcdir}/nekoray/deployment/linux64/nekoray_core" "${pkgdir}/usr/lib/nekoray/"
	cp -a "${srcdir}/nekoray/deployment/linux64/nekobox_core" "${pkgdir}/usr/lib/nekoray/"
	# app
	cp -a "${srcdir}/nekoray/build/nekoray" "${pkgdir}/usr/lib/nekoray/"
	ln -s  "/usr/lib/nekoray/nekoray" "${pkgdir}/usr/bin/nekoray"
}
