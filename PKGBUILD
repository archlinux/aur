# Maintainer: grgergo <gergo@tutanota.de>
pkgname=xpano-git
pkgver=0.19.3.r0.g11a00d4
pkgrel=1
pkgdesc='A tool for panorama stitching with focus on simplicity and ease of use'
arch=('x86_64')
url='https://krupkat.github.io/xpano/'
license=(GPL-3.0-or-later)
depends=(opencv sdl2 spdlog exiv2)
makedepends=(git)
checkdepends=(catch2)
source=("git+https://github.com/krupkat/xpano"
        "git+https://github.com/p-ranav/alpaca"
        "git+https://github.com/TartanLlama/expected"
        "git+https://github.com/krupkat/imgui"
        "git+https://github.com/krupkat/multiblend"
        "git+https://github.com/btzy/nativefiledialog-extended"
        "git+https://github.com/simd-everywhere/simde"
        "git+https://github.com/krupkat/thread-pool")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/xpano"
	git submodule init
	git config submodule.external/imgui.url "$srcdir/imgui"
	git config submodule.external/nativefiledialog-extended.url "$srcdir/nativefiledialog-extended"
	git config submodule.external/thread-pool.url "$srcdir/thread-pool"
	git config submodule.external/alpaca.url "$srcdir/alpaca"
	git config submodule.external/expected.url "$srcdir/expected"
	git config submodule.external/multiblend.url "$srcdir/multiblend"
	git config submodule.external/simde.url "$srcdir/simde"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/xpano"
	export BUILD_TYPE='Release'
	export GENERATOR='Ninja Multi-Config'
	export C_COMPILER='gcc'
	export CXX_COMPILER='g++'


	cmake -B build \
		-DCMAKE_C_COMPILER=$C_COMPILER \
		-DCMAKE_CXX_COMPILER=$CXX_COMPILER \
		-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
		-DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
		-DBUILD_TESTING=ON \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \

	cmake --build build -j $(nproc)
}

check() {
	cd "$srcdir/xpano/build"
	ctest --output-on-failure
}

package() {
	cd "$srcdir/xpano/build"
	cmake --install .
	install -Dm644 ../misc/build/linux/xpano.desktop $pkgdir/usr/share/applications/xpano.desktop
	install -Dm644 ../misc/build/linux/xpano.png $pkgdir/usr/share/pixmaps/xpano.png
	install -Dm644 ../misc/build/linux/xpano.svg $pkgdir/usr/share/pixmaps/xpano.svg
}

pkgver() {
  cd "$srcdir/xpano"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
