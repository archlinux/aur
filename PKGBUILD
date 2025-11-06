# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp
pkgver=1.0.0
pkgrel=1
pkgdesc="A Qt6 QImageIO plugin to load VTF textures."
arch=('x86_64')
url="https://github.com/craftablescience/qvtfpp"
license=('LGPL-2.1-only')
depends=('qt6-base' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=("${pkgname::-2}")
conflicts=("${pkgname::-2}")
source=("git+$url.git#tag=v${pkgver}"
	"git+${url::-6}sourcepp.git"
	"git+${url::-6}cmake-helpers.git")
sha256sums=('42f430abf17c07ec76ef77dff5ee44da694afb54b9c48408a9b0c30f582916b4'
            'SKIP'
            'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/${pkgname}"
	git submodule init
	git config submodule.ext/sourcepp.url "$srcdir/sourcepp"
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} \
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
