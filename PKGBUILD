# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=obs-audio-video-sync-dock
pkgver=0.1.4
pkgrel=2
pkgdesc='Measuring latency between audio and video on OBS Studio'
arch=(x86_64 aarch64)
url="https://github.com/norihiro/$pkgname"
license=(GPL-2.0-or-later)
depends=(glibc # libc.so libm.so
         libgcc
         obs-studio # libobs.so libobs-frontend-api.so
         qt6-base # libQt6Core.so libQt6Widgets.so
         quirc)
makedepends=(cmake
             git
             simde)
source=("git+$url.git#tag=$pkgver"
        "git+https://github.com/dlbeer/quirc.git#tag=v1.2")
sha256sums=('bd1116de639fef22859278b5d26034f970d1ea6e2598617d84d081e929c73d40'
            'd1e60205f7665af43d415528cb92ae7aa4653b3cece78ba5dcb3f480dc45077a')

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule."deps/quirc".url "${srcdir}/quirc"
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
	          libstdc++.so)
	DESTDIR="$pkgdir" cmake --install build
}
