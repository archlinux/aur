# Maintainer: Lukas Spies <lukas_(a|t)_photoqt_org>

pkgname=libsai
pkgver=r252.6c7e320
pkgrel=1
pkgdesc="Library for reading PaintTool Sai image files."
arch=(x86_64)
url="https://github.com/Wunkolo/libsai"
license=(MIT)
makedepends=(git)
source=("git+https://github.com/Wunkolo/libsai")
sha256sums=("SKIP")

pkgver() {
	cd "libsai"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "libsai"

	sed -i '/add_library(/ { N; s/\n\tsai/\n\tsai SHARED/ }' CMakeLists.txt

	echo "
install(
	TARGETS Thumbnail Decrypt Tree Document
	DESTINATION bin/
)

install(
	TARGETS sai
	DESTINATION lib/
)

install(
	FILES include/sai.hpp
	DESTINATION include/
)

" >> CMakeLists.txt

	mkdir -p build
}

build() {
	cd "libsai/build"
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "libsai/build"
	make DESTDIR=$pkgdir install
}
