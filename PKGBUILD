# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng
pkgver=2.0.0_RC2
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
source=("https://github.com/zlib-ng/zlib-ng/archive/v${pkgver//_/-}.zip")
sha256sums=("e6190debf17c16810f015453c9c43c1f2a88ec96a95e050a3a9694d0a4ab9de2")

build() {
    cmake \
         -Wno-dev \
         -B build \
         -S "zlib-ng-${pkgver//_/-}" \
         -DCMAKE_BUILD_TYPE=None \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DZLIB_COMPAT=ON

    make -C build
}

check() {
    make \
        -C build \
        test
}

package() {
    make \
        -C build \
        install \
            DESTDIR="$pkgdir" \

    install -D -m644 "zlib-ng-${pkgver//_/-}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
