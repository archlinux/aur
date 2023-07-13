pkgname=openspace-git
pkgver=v0.18.0.1204.g80ddf3e187 
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('glm' 'websocketpp' 'gdal' 'mpv' 'cmake')
depends=()
conflicts=('openspace')
source=("git+https://github.com/OpenSpace/OpenSpace.git"
	"git+https://github.com/HowardHinnant/date.git"
	"git+https://github.com/OpenSpace/Ghoul.git"
	"git+https://github.com/OpenSpace/Spice.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/OpenSpace"
	git describe --always | sed 's/-/./g' | sed 's/\///g' | sed 's/releases//g'
}

prepare() {
	cd "${srcdir}/OpenSpace"
        git submodule init
	git config submodule.ext/date.url			"${srcdir}/date"
	git config submodule.ext/ghoul.url			"${srcdir}/Ghoul"
	git config submodule.ext/spice.url			"${srcdir}/Spice"

	cd "${srcdir}/OpenSpace/ext/ghoul"
        git submodule init

	cd "${srcdir}/OpenSpace/apps/OpenSpace/ext/sgct"
        git submodule init
	git -c protocol.file.allow=always submodule update
}


build() {
	cd "${srcdir}/OpenSpace"

        [[ -d build ]] && rm -rf build
        mkdir build && cd build
	cmake \
	-DCMAKE_BUILD_TYPE:STRING="Release" \
	-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
	-DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc \
	-DASSIMP_BUILD_MINIZIP=1 "${srcdir}/OpenSpace"
	
	make
}

package() {
	cd "${srcdir}/OpenSpace"
  	make DESTDIR="$pkgdir" install
}
