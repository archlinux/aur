# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=usdtweak
pkgver=2024.07.20
pkgrel=1
pkgdesc='USD Standalone Editor'
arch=(x86_64)
url='https://github.com/cpichard/'$pkgname
license=('Apache')
depends=(usd
		usd-extras
		python
		libglvnd
		boost-libs
		jemalloc
		glibc
		gcc-libs
		boost)
makedepends=(cmake)
options=(!lto)
source=("$pkgname::git+$url.git#tag=$pkgver-prealpha"
		"usdtweak.desktop")
sha512sums=('e86bcb1dba9ad335965aee80b14fe19e50fa02f2eef1c3bf7630a5ae658501b6fab77aa5f2f29a5c01b4a69b82cf5bf97f7b61f09e8dd822fdfbb7d5eb775d3b'
            '5bcaa06349ffcbe64b1d00519a5c7559804dc5500ed05b747f887d7aff19e111dddef32ce6ca5019505bdda415606b73514dbb47b614ab9f87c85add4f51c199')

prepare() {
	# Change config file to .config folder
	sed -i 's/\/\./\/.config\//g' \
			${srcdir}/$pkgname/src/resources/ResourcesLoader.cpp

	# imgui.ini on .config dir instead of relative to workdir
	sed -i 's|imgui.ini|~/.config/usdtweak.ini|g' \
			${srcdir}/$pkgname/src/3rdparty/imgui/imgui.cpp

	sed -i '10i #include <algorithm>' \
			${srcdir}/$pkgname/src/widgets/FileBrowser.cpp
}

build() {
# 	export CC=clang && export CXX=clang++
	
	_CMAKE_FLAGS+=(
		-DBUILD_SHARED_LIBS=OFF
		-DCMAKE_SKIP_INSTALL_RPATH=ON
		-DCMAKE_SKIP_RPATH=ON
		-DUSE_PYTHON3=ON
	)

	cmake -S $pkgname -B build -G Ninja "${_CMAKE_FLAGS[@]}"
	ninja -C build -j$(($(nproc) - 2))
}

package() {
	install -Dm755 ${srcdir}/build/$pkgname ${pkgdir}/usr/bin/$pkgname
	
	install -Dm644 ${srcdir}/$pkgname/src/resources/app.ico ${pkgdir}/usr/share/icons/hicolor/scalable/apps/$pkgname
	install -Dm755 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
}
