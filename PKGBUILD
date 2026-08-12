# Maintainer: Bink
# Contributor: grgergo <gergo@tutanota.de>
pkgname=xpano-git
pkgver=0.19.3.r4.ga5df2e0
pkgrel=1
pkgdesc='A tool for panorama stitching with focus on simplicity and ease of use'
arch=('x86_64')
url='https://krupkat.github.io/xpano/'
license=(GPL-3.0-or-later)
depends=(	
	exiv2
	gtk3
	opencv
	sdl3
	spdlog
)
makedepends=(
	cmake
	git
	ninja
)
checkdepends=(catch2)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/krupkat/xpano"
        "git+https://github.com/p-ranav/alpaca"
        "git+https://github.com/TartanLlama/expected"
        "git+https://github.com/ocornut/imgui"
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

pkgver() {
	cd "$srcdir/xpano"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
	local cmake_options=(
		-B build
		-S xpano
		-G Ninja
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_TESTING=ON
		-Wno-author
	)

	# OpenCV 5 renamed some modules; this small shim maps the old names so the
	# build still works without patching upstream.
	if [[ -d /usr/lib/cmake/opencv5 ]]; then
		install -d opencv-compat
		cat > opencv-compat/OpenCVConfig.cmake <<-'EOF'
			list(TRANSFORM OpenCV_FIND_COMPONENTS REPLACE "^(opencv_)?calib3d$" "calib")
			list(TRANSFORM OpenCV_FIND_COMPONENTS REPLACE "^(opencv_)?features2d$" "features")

			include("/usr/lib/cmake/opencv5/OpenCVConfig.cmake")

			foreach(_pair "calib3d;calib" "features2d;features")
			  list(GET _pair 0 _old)
			  list(GET _pair 1 _new)
			  if(TARGET opencv_${_new} AND NOT TARGET opencv_${_old})
			    add_library(opencv_${_old} INTERFACE IMPORTED GLOBAL)
			    set_target_properties(opencv_${_old} PROPERTIES
			      INTERFACE_LINK_LIBRARIES opencv_${_new})
			  endif()
			endforeach()
		EOF
		cmake_options+=(-D OpenCV_DIR="$srcdir/opencv-compat")
	fi

	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
