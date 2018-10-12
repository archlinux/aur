# Maintainer: Brendan Szymanski <brendan.szymanski1@gmail.com>

_pkgname=citra
pkgname=$_pkgname-qt-canary-git
pkgver=r7050.263912103
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger written in C++"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra-canary/tree/master"
license=('GPL2')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia')
makedepends=('git' 'cmake')
optdepends=('libxkbcommon-x11: for X11 support'
	'qt5-wayland: for Wayland support')
source=("$_pkgname::git+https://github.com/citra-emu/citra-canary#branch=master"
        'git+https://github.com/citra-emu/ext-boost'
        'git+https://github.com/neobrain/nihstro'
        'git+https://github.com/citra-emu/ext-soundtouch'
        'git+https://github.com/philsquared/Catch'
        'git+https://github.com/MerryMage/dynarmic'
        'git+https://github.com/herumi/xbyak'
        'git+https://github.com/weidai11/cryptopp'
        'git+https://github.com/fmtlib/fmt'
        'git+https://github.com/lsalzman/enet'
        'git+https://github.com/benhoyt/inih'
	'git+https://github.com/citra-emu/ext-libressl-portable'
	'git+https://github.com/kinetiknz/cubeb')
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
	git config submodule.boost.url "$srcdir/ext-boost"
	git config submodule.nihstro.url "$srcdir/nihstro"
	git config submodule.soundtouch.url "$srcdir/ext-soundtouch"
	git config submodule.catch.url "$srcdir/Catch"
	git config submodule.dynarmic.url "$srcdir/dynarmic"
	git config submodule.xbyak.url "$srcdir/xbyak"
	git config submodule.cryptopp.url "$srcdir/cryptopp"
	git config submodule.fmt.url "$srcdir/fmt"
	git config submodule.enet.url "$srcdir/enet"
	git config submodule.inih.url "$srcdir/inih"
	git config submodule.libressl.url "$srcdir/ext-libressl-portable"
	git config submodule.cubeb.url "$srcdir/cubeb"
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
	rm "$pkgdir/usr/bin/$_pkgname"
}
