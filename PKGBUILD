# Maintainer: otreblan <otreblain@gmail.com>

pkgname=doccreator-distortion3d-git
pkgver=r395.50cfbc7
pkgrel=1
pkgdesc='DIAR software for synthetic document image and groundtruth generation'
arch=('x86_64')
url="https://github.com/DocCreator/DocCreator"
provides=(${pkgname%-distortion3d-git})
conflicts=(${pkgname%-distortion3d-git})
license=('LGPL')
depends=('tesseract' 'qt5-base' 'opencv' 'lzham' 'zlib')
makedepends=('cmake' 'git' 'dos2unix')
source=("$pkgname::git+$url.git#branch=Distortion3D" "tesseract.patch")
sha256sums=('SKIP'
            'b5c373b692c868f2f69a96efb9cf7611d520768052c9bc26de7b57e7a30c8914')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	find . -exec dos2unix "{}" +
	patch --forward --strip=1 --input="$srcdir/tesseract.patch"

	sed -i "s/#include <vector>/&\n#include <limits>/" framework/src/Degradations/Distortion3DModel/src/Mesh.hpp
}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_OTHER_PROGS=ON \
		-DBUILD_OTHER_PROGS_3D=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# TODO: Use system-wide zlib and lzham
	cd "$pkgdir/usr/include"
	rm zlib.h lzham*

	cd "$pkgdir/usr/lib"
	rm liblzham*
}
