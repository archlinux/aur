# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: Luka Perkov <luka.perkov@sartura.hr>

pkgname=libyang-git
_gitname=libyang
pkgver=r4278.838c6c6ad
pkgrel=1
pkgdesc='libyang is YANG data modelling language parser and toolkit written (and providing API) in C'
url='https://github.com/CESNET/libyang/'
arch=('i686' 'x86_64' 'armv7h')
license=('ISC' 'BSD')
depends=('glibc' 'pcre2')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config' 'cmocka' 'valgrind')
conflicts=('libyang' 'libyang-git')
provides=('libyang')
source=('git+https://github.com/CESNET/libyang.git#branch=devel')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	install -Dm644 $_gitname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
