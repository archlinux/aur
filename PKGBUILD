# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: ceri

_pkgbase='citra'
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-git" "$_pkgbase-qt-git")
pkgver=r3548.fda578e
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra/"
license=('GPL2')
makedepends=('git' 'cmake' 'sdl2' 'qt5-base' 'shared-mime-info' 'desktop-file-utils')
source=("$_pkgbase::git+https://github.com/citra-emu/citra"
        'git+https://github.com/citra-emu/ext-boost'
        'git+https://github.com/svn2github/inih'
        'git+https://github.com/neobrain/nihstro'
        'git+https://github.com/citra-emu/soundtouch')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgbase"
	mkdir -p build

	git submodule init
	git config submodule.boost.url "$srcdir/ext-boost"
	git config submodule.inih.url "$srcdir/inih"
	git config submodule.nihstro.url "$srcdir/nihstro"
	git config submodule.soundtouch.url "$srcdir/soundtouch"
	git submodule update
}

build() {
	cd "$srcdir/$_pkgbase/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package_citra-git() {
	depends=('sdl2' 'libpng')

	install -Dm755 "$srcdir/$_pkgbase/build/src/citra/citra" "$pkgdir/usr/bin/$_pkgbase"
}

package_citra-qt-git() {
	depends=('qt5-base' 'shared-mime-info' 'desktop-file-utils')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')

	cd "$srcdir/$_pkgbase/build"
	make DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/bin/$_pkgbase"
}
