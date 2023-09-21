# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=usdtweak
pkgver=0.49.g7a83aef
pkgrel=1
pkgdesc='USD Standalone Editor'
arch=(x86_64)
url='https://github.com/cpichard/'$pkgname
license=('Apache')
depends=(usd
		python
		libglvnd
		boost-libs
		jemalloc
		glibc
		gcc-libs)
makedepends=(cmake)
options=(!lto)
source=("git+$url#branch=develop"
		"usdtweak.desktop")
sha512sums=('SKIP'
            '5bcaa06349ffcbe64b1d00519a5c7559804dc5500ed05b747f887d7aff19e111dddef32ce6ca5019505bdda415606b73514dbb47b614ab9f87c85add4f51c199')
			
pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed -E 's/.*-([0-9]+)-g([0-9a-f]+)$/0.\1.g\2/'
}

prepare() {
	# Change config file to .config folder
	sed -i 's/\/\./\/.config\//g' \
			${srcdir}/$pkgname/src/resources/ResourcesLoader.cpp
}
			
build() {
	export CC=clang && export CXX=clang++
	
	_CMAKE_FLAGS+=(
		-DBUILD_SHARED_LIBS=OFF
		-DCMAKE_SKIP_INSTALL_RPATH=ON
		-DCMAKE_SKIP_RPATH=ON
		-DUSE_PYTHON3=ON
	)

	cmake -S $pkgname -B build -G Ninja "${_CMAKE_FLAGS[@]}"
	ninja -C build -j$(($(nproc) - 4))
}

package() {
	install -Dm755 ${srcdir}/build/$pkgname ${pkgdir}/usr/bin/$pkgname
	
	install -Dm644 ${srcdir}/$pkgname/src/resources/app.ico ${pkgdir}/usr/share/icons/hicolor/scalable/apps/usdtweak
	install -Dm755 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
}
