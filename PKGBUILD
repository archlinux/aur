# Maintainer: Andreas Baumann <mail at andreasbaumann dot cc>
pkgname=cssh
pkgver=0.0.1.r14.g6c92d89
pkgrel=2
pkgdesc="Cluster Secure Shell/Copy based on libssh, for managing clusters in parallel"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://git.andreasbaumann.cc/cgit/cssh/"
license=('GPL-3.0-or-later')
depends=('libssh' 'ncurses')
makedepends=('git' 'cmake' 'gengetopt')
provides=('cscp')
source=("git+https://git.andreasbaumann.cc/cgit/cssh#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	ln -s cssh "$pkgdir/usr/bin/cscp"

	install -Dm644 "$pkgname/man/cssh.1" "$pkgdir/usr/share/man/man1/cssh.1"
	install -Dm644 "$pkgname/man/cscp.1" "$pkgdir/usr/share/man/man1/cscp.1"

	install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
