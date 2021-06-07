# Maintainer: Aditya Gupta <ag15035 at gmail dot com>
pkgname=cpproj-git
pkgver=r28.eedf654
pkgrel=1
pkgdesc="C++ Package Management tool based on cargo (rust)"
arch=('x86_64')
url="https://github.com/adi-g15/cpproj"
license=('Unlicense')
depends=('cmake')
makedepends=('git' 'gcc' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/adi-g15/cpproj.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --depth 1
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build && cd build
	rm -f CMakeCache.txt
	cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build . # --config Release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	DESTDIR="$pkgdir/" ninja install
}
