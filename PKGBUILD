pkgname=executor-git
pkgver=0.1.0.r437.g27c8ef28
pkgrel=1
pkgdesc="A modern fork of the classic Mac emulator"
arch=('x86_64')
url="https://github.com/autc04/executor"
license=('MIT')
depends=('qt5-base' 'executor-data')
makedepends=('git' 'cmake' 'ruby' 'sdl' 'sdl2' 'libxext' 'waylandpp' 'python'
             'boost' 'perl')
optdepends=('sdl2: for SDL 2 frontend'
            'sdl: for SDL 1.2 frontend'
            'libxext: for X11 frontend'
            'waylandpp: for Wayland frontend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/autc04/executor.git')
sha256sums=('SKIP')
options=(!lto !debug)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git submodule update
}

build() {
	mkdir "$srcdir/${pkgname%-git}"/build 
	cd "$srcdir/${pkgname%-git}"/build
	cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build .
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/{${pkgname%-git},${pkgname%-git}{-sdl,-sdl2,-wayland,-x}} -t \
		"$pkgdir/usr/bin"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
