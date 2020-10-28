pkgname=executor-git
pkgver=0.1.0.r203.ga7451c9f
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
source=('git+https://github.com/autc04/executor.git'
        'git+https://github.com/autc04/PowerCore.git'
        'git+https://github.com/vector-of-bool/cmrc.git'
        'git+https://github.com/autc04/cxmon.git'
        'git+https://github.com/LMDB/lmdb.git'
        'git+https://github.com/autc04/lmdbxx.git'
        'git+https://github.com/autc04/multiversal.git'
        'git+https://github.com/autc04/syn68k.git'
        'git+https://github.com/google/googletest.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.PowerCore.url $srcdir/PowerCore
	git config submodule.cmrc.url $srcdir/cmrc
	git config submodule.cxmon.url $srcdir/cxmon
	git config submodule.lmdb.url $srcdir/lmdb
	git config submodule.lmdbxx.url $srcdir/lmdbxx
	git config submodule.multiversal.url $srcdir/multiversal
	git config submodule.syn68k.url $srcdir/syn68k
	git config submodule.tests/googletest.url $srcdir/googletest
	git submodule update
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-Wno-dev
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 $srcdir/build/{${pkgname%-git},${pkgname%-git}{-sdl,-sdl2,-wayland,-x}} -t \
		"$pkgdir/usr/bin"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}