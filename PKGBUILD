# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=obs-async-audio-filter
pkgver=0.6.0
pkgrel=2
pkgdesc='This filter aims to fix audio glitches caused by asynchronous audio of the source'
arch=(x86_64 aarch64)
url="https://github.com/norihiro/$pkgname"
license=(GPL-2.0-or-later)
depends=(glibc # libc.so libm.so
         libgcc
         libsamplerate
         obs-studio # libobs.so libobs-frontend-api.so
         qt6-base) # libQt6Core.so libQt6Widgets.so
makedepends=(cmake
             git
             simde)
source=("git+$url.git#tag=$pkgver")
sha256sums=('fd1b91e730267cd07bfab74561d1b35f3306a0d4f2c0cb3b8c0c56942a880585')

prepare() {
	cd "$pkgname"
	sed -i -e '/set.PLUGIN/s#obs-modules/plugins#obs-plugins#' cmake/ObsPluginHelpers.cmake
}

build() {
	local cmake_options=(
		CMAKE_BUILD_TYPE=None
		CMAKE_INSTALL_PREFIX=/usr
		LINUX_PORTABLE=OFF
		USE_ERIKD_LIBSAMPLERATE_DEPS=OFF
		USE_ERIKD_LIBSAMPLERATE_SYSTEM=ON
	)
	cmake -B build -S $pkgname -Wno-author "${cmake_options[@]/#/-D }"
	cmake --build build
}

package() {
	depends+=(libgcc_s.so
	          libsamplerate.so
	          libstdc++.so)
	DESTDIR="$pkgdir" cmake --install build
}
