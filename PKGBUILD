# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=obs-async-audio-filter
pkgver=0.6.0
pkgrel=1
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
source=("git+$url.git#tag=$pkgver"
        "git+https://github.com/libsndfile/libsamplerate.git#tag=0.2.2")
sha256sums=('fd1b91e730267cd07bfab74561d1b35f3306a0d4f2c0cb3b8c0c56942a880585'
            'f2d8de20d607298f16cceb8ec38a87b07fb1dad344aef9957777f999e3466f43')

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule."deps/libsamplerate".url "${srcdir}/libsamplerate"
	git -c protocol.file.allow=always submodule update
}

build() {
	local cmake_options=(
		CMAKE_BUILD_TYPE=None
		CMAKE_INSTALL_PREFIX=/usr
		LINUX_PORTABLE=OFF
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
