# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng
pkgver=2.0.1
pkgrel=1
pkgdesc="zlib replacement with optimizations for \"next generation\" systems"
arch=("any")
url="https://github.com/zlib-ng/zlib-ng"
license=("zlib")
depends=(
	"glibc"
)
makedepends=(
	"cmake"
)
provides=(
	"zlib=1.2.11"
	"zlib-ng"
)
conflicts=(
	"zlib"
	"zlib-ng"
	"zlib-ng-git"
)
source=("https://github.com/zlib-ng/zlib-ng/archive/${pkgver//_/-}.zip")
sha256sums=("7438bf8f004b920573c58be9e43ea104a25309f85eb7d9acaf54578ff3879b44")

build() {
    cmake \
         -S "zlib-ng-${pkgver//_/-}" \
         -B build \
         -Wno-dev \
         -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DZLIB_COMPAT=ON

    make -C build
}

check() {
    make -C build \
        test
}

package() {
    make -C build \
        install \
        DESTDIR="$pkgdir" \

    install -D -m644 "zlib-ng-${pkgver//_/-}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
