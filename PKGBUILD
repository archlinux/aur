# Maintainer: Brendan Szymanski <brendan.szymanski1@gmail.com>

_pkgname=yuzu
pkgname=$_pkgname-canary-git
pkgver=r9492.2dcb93091
pkgrel=1
pkgdesc="An experimental open-source Nintendo Switch emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/yuzu-emu/yuzu-canary"
license=('GPL2')
depends=('shared-mime-info' 'desktop-file-utils' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-tools' 'libxkbcommon-x11')
makedepends=('git' 'cmake' 'python')
optdepends=('qt5-wayland: for Wayland support')
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
        'git+https://github.com/citra-emu/ext-soundtouch'
        'git+https://github.com/citra-emu/ext-libressl-portable'
        'git+https://github.com/discordapp/discord-rpc.git'
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
         'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

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
	git config submodule.libressl.url "$srcdir/ext-libressl-portable"
	git config submodule.discord-rpc.url "$srcdir/discord-rpc"
	git submodule update --init --recursive

	cd externals/cubeb
	git config submodule.googletest.url "$srcdir/googletest"
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git submodule update --init --recursive

	cd ../dynarmic
	git config submodule.externals/fmt.url "$srcdir/fmt"
	git config submodule.externals/xbyak.url "$srcdir/xbyak"
	git submodule update --init --recursive
}

build() {
	# Trick the compiler into thinking we're building from a continuous
	# integration tool so the build number is correctly shown in the title
	cd "$srcdir/$_pkgname"
	export CI=true
	export TRAVIS=true
	export TRAVIS_REPO_SLUG=yuzu-emu/yuzu-canary
	export TRAVIS_TAG=$(git describe --tags)
	
	mkdir -p build
	cd build
	cmake .. \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DYUZU_USE_BUNDLED_UNICORN=ON \
	  -DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
	  -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
	  -DUSE_DISCORD_PRESENCE=ON
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
