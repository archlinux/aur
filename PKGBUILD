# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libevdevplus
_pkg=libevdevPlus
pkgver=0.2.1
pkgrel=2
pkgdesc="Easy-to-use event device library in C++"
url="https://github.com/YukiWorkshop/libevdevPlus"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cmake')
provides=('libevdevPlus.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "001-install-directives.patch::$url/commit/cb3ca40.patch")
sha256sums=('c656a29258222c3f058f2ddd7e4f7f5f30fb92c74a25cf0db460139cce0668b9'
            '10b66dbbb7d977471ff6f095cb4d607e090dcec23a099a2fdd93fe45a01f321a')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < 001-install-directives.patch
	sed -i "s|include/|include/$pkgname/|" "libevdevPlus-$pkgver/CMakeLists.txt"
}

build() {
	cmake \
		-B build \
		-S "$_pkg-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm644 "$_pkg-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
