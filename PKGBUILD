# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=mynt-eye-s-sdk
pkgver=2.5.0
pkgrel=1
pkgdesc="Cross-platform library for Mynt Eye Standard cameras"
arch=('x86_64')
url="https://github.com/slightech/MYNT-EYE-S-SDK"
license=('Apache')
depends=(
	'cuda'
	'opencv3-opt'
	'v4l-utils'
)
makedepends=(
	'cmake'
	'git'
)
source=("${pkgname}-${pkgver}::git+https://github.com/slightech/MYNT-EYE-S-SDK.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	[ ! -d build ] || rm -rf build
	mkdir build && cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DBUILD_SHARED_LIBS=ON \
		-DOpenCV_DIR=/opt/opencv3/share/OpenCV
}

build() {
	cd "$pkgname-$pkgver/build"
	make
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install

	install -D -m644 \
		"${srcdir}/$pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

