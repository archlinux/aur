# Maintainer: otreblan <otreblain@gmail.com>

pkgname=doccreator-git
pkgver=r322.6d22082
pkgrel=1
pkgdesc='DIAR software for synthetic document image and groundtruth generation'
arch=('x86_64')
url="https://github.com/DocCreator/DocCreator"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
license=('LGPL')
depends=('tesseract' 'qt5-base' 'opencv' 'lzham' 'zlib')
makedepends=('cmake' 'git')
source=("${pkgname}::git+${url}.git" "tesseract.patch")
sha256sums=('SKIP'
            'e00299613c83dd468bfe3ce5fddbbfbc93751f1a2f731280c46505bdbbaf6ff9')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	patch --forward --strip=1 --input="$srcdir/tesseract.patch"
}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON

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
