# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=ffnightman-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Siemens filesystem extractor.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/ffnightman'
license=(MIT)
depends=(libffshit-git)
makedepends=(cmake)
source=(git+https://github.com/siemens-mobile-hacks/ffnightman)
sha256sums=('SKIP')

prepare() {
	cd "ffnightman"
	git submodule init
	git submodule update
}

build() {
	cmake -B build -S ffnightman -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "ffnightman"
	cmake_version=$(cat CMakeLists.txt | grep 'project(' -i | grep -P 'VERSION[ ]*[.0-9]*' -o | head -n1 | awk '{ print $2 }')
	if [[ $cmake_version = "" ]]; then
		cmake_version="0.0.1"
	fi
	echo $cmake_version
}
