# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
pkgname=mojozork-git
_pkgname=mojozork
pkgver=r220.5c8d81f
pkgrel=1
pkgdesc="A simple Z-Machine implementation in a single C file"
arch=('x86_64')
url="https://github.com/icculus/mojozork"
license=('Zlib')
depends=('sqlite' 'glibc')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev -B build -S .
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"
	# executables
	install -Dm 0755 build/mojozork "$pkgdir/usr/bin/mojozork"
	install -Dm 0755 build/multizorkd "$pkgdir/usr/bin/multizorkd"

	# other
	install -Dm 0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm 0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 notes.txt "$pkgdir/usr/share/doc/$pkgname/notes.txt"
	install -Dm 0644 build/mojozork_libretro.so "$pkgdir/usr/lib/mojozork_libretro.so"
	install -Dm 0644 zork1.dat "$pkgdir/usr/share/zork1.dat"
}
