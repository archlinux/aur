# Maintainer: Brendan Szymanski <brendan.szymanski1@gmail.com>

_pkgname=yuzu
pkgname=$_pkgname-qt-canary-git
pkgver=r8996.c9fd223ae
pkgrel=1
pkgdesc="An experimental open-source Nintendo Switch emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/yuzu-emu/yuzu-canary"
license=('GPL2')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia')
makedepends=('git' 'cmake' 'python')
optdepends=('libxkbcommon-x11: for X11 support'
	'qt5-wayland: for Wayland support')
provides=('yuzu')
conflicts=('yuzu')
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu-canary"
        'git+https://github.com/svn2github/inih'
        'git+https://github.com/yuzu-emu/ext-boost'
        'git+https://github.com/philsquared/Catch'
        'git+https://github.com/kinetiknz/cubeb'
        'git+https://github.com/MerryMage/dynarmic'
        'git+https://github.com/herumi/xbyak'
        'git+https://github.com/fmtlib/fmt'
        'git+https://github.com/lz4/lz4'
        'git+https://github.com/yuzu-emu/unicorn'
        'git+https://github.com/DarkLordZach/mbedtls'
        'git+https://github.com/ogniK5377/opus'
        'git+https://github.com/citra-emu/ext-soundtouch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p build

	git submodule init
	git config submodule.inih.url "$srcdir/inih"
	git config submodule.boost.url "$srcdir/ext-boost"
	git config submodule.catch.url "$srcdir/Catch"
	git config submodule.cubeb.url "$srcdir/cubeb"
	git config submodule.dynarmic.url "$srcdir/dynarmic"
	git config submodule.xbyak.url "$srcdir/xbyak"
	git config submodule.fmt.url "$srcdir/fmt"
	git config submodule.lz4.url "$srcdir/lz4"
	git config submodule.unicorn.url "$srcdir/unicorn"
	git config submodule.mbedtls.url "$srcdir/mbedtls"
	git config submodule.opus.url "$srcdir/opus"
	git config submodule.soundtouch.url "$srcdir/ext-soundtouch"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname/build"
	cmake .. \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DUSE_SYSTEM_CURL=1
	make
}

check() {
	cd "$srcdir/$_pkgname/build"
	make test
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/bin/${_pkgname}-cmd"
}
