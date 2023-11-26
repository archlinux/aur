# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libshv-git
_gitname=libshv
pkgver=r2348.a6a3e3a1
pkgrel=1
pkgdesc='An RPC framework build around the ChainPack packing schema'
url='https://github.com/silicon-heaven/libshv/'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL-3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'pkg-config' 'doctest')
conflicts=('libshv' 'libshv-git')
provides=('libshv')
source=('git+https://github.com/silicon-heaven/libshv.git#branch=cmake-pkg'
		'git+https://github.com/syyyr/necrolog.git#branch=pkgconfig')
md5sums=('SKIP'
		 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	ctest --test-dir "$srcdir/build"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DLIBSHV_USE_LOCAL_NECROLOG=ON \
	-DWITH_CLI_EXAMPLES=ON

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
