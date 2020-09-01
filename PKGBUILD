# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libfev-git
pkgver=r6.45958a6
pkgrel=1
epoch=
pkgdesc="A library for events and fibers"
arch=('x86_64')
url="https://github.com/patrykstefanski/libfev"
license=('APACHE' 'MIT')
groups=()
depends=('glibc')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	mkdir -p build

	# Needed for link time optimization
	local CMAKE_VERSION=$(LC_ALL=C cmake --version | awk 'n++<1 {print $3}')
	sed -i "s/\(cmake_minimum_required(VERSION\).*/\1 $CMAKE_VERSION)/" CMakeLists.txt
}

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname/build"

	cmake \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_UNITY_BUILD=ON \
		..

	make
}

package() {
	cd "$srcdir/$pkgname/build"

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
