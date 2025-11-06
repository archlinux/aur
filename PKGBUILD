# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp-git
pkgver=1.0.0.r0.g008c84b
pkgrel=1
pkgdesc="A Qt6 QImageIO plugin to load VTF textures."
arch=('x86_64')
url="https://github.com/craftablescience/qvtfpp"
license=('LGPL-2.1-only')
depends=('qt6-base' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=("${pkgname::-4}" "${pkgname::-6}")
conflicts=("${pkgname::-4}" "${pkgname::-6}")
source=("git+$url.git"
	"git+${url::-6}sourcepp.git"
	"git+${url::-6}cmake-helpers.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver(){
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	git submodule init
	git config submodule.ext/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname::-4} \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCPACK_GENERATOR=RPM \
	-GNinja

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
