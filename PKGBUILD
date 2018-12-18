# Maintainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>
pkgname=ckmame-git
pkgver=r1911.473bf78
pkgrel=1
pkgdesc="A program to check ROM sets for MAME, the Multiple Arcade Machine Emulator. Git version."
arch=('any')
url="https://nih.at/ckmame/"
license=('custom')
groups=()
depends=('zlib>=1.1.2' 'libzip>=1.0' 'sqlite>=3.0')
optdepends=('libxml2: for M.A.M.E. -listxml and detectors')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
noextract=()
source=('git+https://github.com/nih-at/ckmame.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
}


build() {
	cd build
	cmake ../${pkgname%-git} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd build
	make -k check
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
