# Maintainer: Brendan Szymanski <brendan.szymanski1@gmail.com>

_pkgname=citra
pkgname=$_pkgname-canary-git
pkgver=r7393.9224b4cab
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger written in C++"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra-canary/tree/master"
license=('GPL2')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11')
makedepends=('git' 'cmake' 'python')
optdepends=('qt5-wayland: for Wayland support')
source=("$_pkgname::git+https://github.com/citra-emu/citra-canary#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	git submodule init
	git submodule update --init --recursive
}

build() {
	# Trick the compiler into thinking we're building from a continuous
	# integration tool so the build number is correctly shown in the title
	cd "$srcdir/$_pkgname"
	export CI=true
	export TRAVIS=true
	export TRAVIS_REPO_SLUG=citra-emu/citra-canary
	export TRAVIS_TAG=$(git describe --tags)
	
	mkdir -p build
	cd build
	cmake .. \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DENABLE_QT_TRANSLATION=ON \
	  -DCITRA_ENABLE_COMPATIBILITY_REPORTING=ON \
	  -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
	  -DUSE_DISCORD_PRESENCE=ON \
	  -DENABLE_SCRIPTING=ON
	make
}

check() {
	cd "$srcdir/$_pkgname/build"
	make test
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
