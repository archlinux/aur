# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>
# Contributor: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname="zlib-ng-git"
pkgver="r1549.b22bc51"
pkgrel=1
epoch=4
arch=("any")
pkgdesc="Zlib replacement with optimizations for \"next generation\" systems."
url="https://github.com/zlib-ng/zlib-ng"
license=("custom: Zlib License")
depends=(
	"glibc"
)
makedepends=(
	"cmake"
	"git"
)
provides=(
	"zlib"
	"zlib-ng"
)
conflicts=(
	"zlib"
)
source=("git+$url.git")
b2sums=("SKIP")

pkgver()
{
	cd "zlib-ng"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cmake \
         -S "zlib-ng" \
         -B "build" \
         -Wno-dev \
         -DCMAKE_BUILD_TYPE="Release" \
         -DCMAKE_INSTALL_PREFIX="/usr" \
         -DZLIB_COMPAT=ON

    make -C "build"
}

check()
{
    make -C "build" test
}

package()
{
    make DESTDIR="$pkgdir" -C "build" install
    install -D -m644 "zlib-ng/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
