# Maintainer: doclic <doclic@tutanota.com>

pkgname=vtex2-git
pkgver=0.1.r120.9339bc9
pkgrel=2
pkgdesc="A VTF conversion and creation tool"
arch=(i686 x86_64 aarch64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('glibc' 'gcc-libs' 'qt6-base')
makedepends=('cmake' 'git')
provides=(vtex2)
conflicts=(vtex2)
source=("git+$url.git")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/vtex2"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/vtex2"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir"
	cmake -B build \
	    -S vtex2 \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DBUILD_GUI=1
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	rm -Rf "$pkgdir"/usr/include "$pkgdir"/usr/lib # remove bundled libs
	install -Dm644 "$srcdir/vtex2/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
