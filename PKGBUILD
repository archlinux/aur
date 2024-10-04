# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libyang-cpp-git
_gitname=libyang-cpp
pkgver=r406.f3cd4e0
pkgrel=1
pkgdesc='C++ bindings for the libyang library'
url='https://github.com/CESNET/libyang-cpp/'
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('libyang' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'pkg-config' 'doctest')
conflicts=('libyang-cpp' 'libyang-cpp-git')
provides=('libyang-cpp')
source=('git+https://github.com/CESNET/libyang-cpp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	ctest --test-dir "$srcdir/build"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_DISABLE_FIND_PACKAGE_date=ON

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
	install -Dm644 $_gitname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
