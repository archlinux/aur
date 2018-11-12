# Maintainer: Brendan Szymanski <brendan.szymanski1@gmail.com>

_pkgname=citra
pkgname=$_pkgname-canary-git
pkgver=r7214.085f4ee39
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger written in C++"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra-canary/tree/master"
license=('GPL2')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11')
makedepends=('git' 'cmake' 'python')
optdepends=('qt5-wayland: for Wayland support')
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
	'git+https://github.com/kinetiknz/cubeb'
	'git+https://github.com/discordapp/discord-rpc'
	'git+https://github.com/zeromq/libzmq'
	'git+https://github.com/zeromq/cppzmq'
	# cubeb dependencies
	'git+https://github.com/google/googletest'
	'git+https://github.com/arsenm/sanitizers-cmake')
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
	git config submodule.discord-rpc.url "$srcdir/discord-rpc"
	git config submodule.libzmq.url "$srcdir/libzmq"
	git config submodule.cppzmq.url "$srcdir/cppzmq"
	git submodule update --init --recursive

	cd externals/dynarmic
	git config submodule.externals/fmt.url "$srcdir/fmt"
	git config submodule.externals/xbyak.url "$srcdir/xbyak"
	git submodule update --init --recursive
	
	cd ../cubeb
	git config submodule.googletest.url "$srcdir/googletest"
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
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
