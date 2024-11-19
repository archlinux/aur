# Maintainer: shtrophic <aur at shtrophic dot net>

_pkgname=libsgm
pkgname=libsgm-git
pkgver=3.1.0.r4.ge4c669b
pkgrel=1
pkgdesc="Stereo Semi Global Matching by cuda"
url="https://github.com/fixstars/libSGM"
arch=(x86_64)
license=(Apache-2.0)
depends=(cuda opencv-cuda)
makedepends=(git)

provides=(libsgm)
source=("$_pkgname::git+$url.git"
	"git+https://github.com/google/googletest.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
	cd $_pkgname
	git submodule init
	git config submodule.libs/googletest.url "$srcdir/googletest"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DBUILD_OPENCV_WRAPPER=ON \
		-DCUDA_USE_STATIC_CUDA_RUNTIME=OFF \
		-DENABLE_SAMPLES=OFF \
		-DENABLE_TESTS=ON \
		-DINSTALL_GTEST=OFF \
		-DLIBSGM_SHARED=ON \
		-Wno-dev
	cmake --build build
}

check() {
	cd "$srcdir/build/test"
	./sgm-test
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p "$pkgdir/usr/lib/cmake/$_pkgname"
	mv "$pkgdir/usr/FindLibSGM.cmake" "$pkgdir/usr/lib/cmake/$_pkgname/LibSGMConfig.cmake"

	install -Dm 644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 "$srcdir/$_pkgname/README"{.jp.md,.md} -t "$pkgdir/usr/share/doc/$_pkgname"
}






