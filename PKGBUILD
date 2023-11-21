# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libshv-git
_gitname=libshv
pkgver=r2342.fe058f25
pkgrel=1
pkgdesc='An RPC framework build around the ChainPack packing schema'
url='https://github.com/silicon-heaven/libshv/'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL-3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'pkg-config' 'doctest')
conflicts=('libshv' 'libshv-git')
provides=('libshv')
source=('git+https://github.com/silicon-heaven/libshv.git'
		'git+https://github.com/fvacek/necrolog.git')
md5sums=('SKIP'
		 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule init
	git config submodule.3rdparty/necrolog.url "$srcdir/necrolog"
	git -c protocol.file.allow=always submodule update
}

check() {
	ctest --test-dir "$srcdir/build"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" -DCMAKE_INSTALL_PREFIX=/usr

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
