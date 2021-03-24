# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng
pkgver=2.0.2
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
sha256sums=("58a86813746ac1e2354244b1e01f22d8b4814c69e7a8fca14c657d13f67bb5bc")

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
