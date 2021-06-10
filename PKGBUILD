# Maintainer: Arthur Sonzogni <i_dont_know_his_mail>
pkgname=ftxui-git
pkgver=r277.4d29dcc
pkgrel=1
pkgdesc="C++ Functional Terminal User Interface"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/FTXUI"
license=('MIT')
depends=('cmake' 'gcc' 'ninja') # ninja is optional, just remove "-G Ninja" from build() too, though its faster if you leave as it is
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ArthurSonzogni/FTXUI")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build && cd build
	cmake -G Ninja \
		-DFTXUI_BUILD_EXAMPLES=OFF \
		-DFTXUI_ENABLE_INSTALL=ON \
		-DFTXUI_BUILD_TESTS=OFF \
		-DFTXUI_BUILD_DOCS=ON \
		.. -DCMAKE_BUILD_TYPE=Release

	cmake --build .
}

check() {
	cd "$srcdir/${pkgname%-git}"/build
	# Left for now, ask Arthur later
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	DESTDIR="$pkgdir/" cmake --install .
}
