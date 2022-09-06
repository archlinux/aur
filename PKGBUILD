# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=rlottie
pkgver=0.2
pkgrel=4
pkgdesc='A platform independent standalone library that plays Lottie Animation'
arch=('x86_64')
url='https://github.com/Samsung/rlottie'
license=('Custom')
makedepends=('cmake' 'git' 'ninja')
depends=('gcc-libs')
optdepends=('lottieconv: Command-line utilities to convert lottie to webp and gif animations')
source=("https://github.com/Samsung/rlottie/archive/refs/tags/v$pkgver.tar.gz"
        '0001-add-missing-include.patch')
sha256sums=('030ccbc270f144b4f3519fb3b86e20dd79fb48d5d55e57f950f12bab9b65216a'
            '6dd2d214beecf74347102b0f4481cfc3a4faa5d8a8ac19d4d03a1ddfd0744d00')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -N -p0 -i "$srcdir/0001-add-missing-include.patch"
	mkdir -p build
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	
	cmake .. \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	ninja
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	
	DESTDIR="$pkgdir" ninja install

	install -Dm644 "../COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	for _file in ../licenses/*; do
		install -Dm644 $_file "$pkgdir/usr/share/licenses/$pkgname/licenses/$(basename $_file)"
	done
}
