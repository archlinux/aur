# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=codecserver-softmbe-git
pkgver=r6.66397fc
pkgrel=2
pkgdesc="Software MBE decoder for codecserver / digiham / openwebrx"
arch=(x86_64 aarch64)
url="https://github.com/knatterfunker/codecserver-softmbe"
license=('GPL-3.0-only')
provides=('codecserver-softmbe')
conflicts=('codecserver-softmbe')
depends=('glibc' 'gcc-libs' 'mbelib' 'protobuf' 'codecserver')
makedepends=('git' 'cmake' 'patch')
source=(
  "$pkgname"::git+https://github.com/knatterfunker/codecserver-softmbe.git
  change_cppversion.patch
)
sha256sums=('SKIP'
            'ef5fe46aa0a4882d1dcc51e1f265318298386ab76e4e2c6543ec5261c754e1be')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/change_cppversion.patch"
    # protobuf >= 23: module-mode find_package collides with config-mode targets
    # pulled in by CodecServer's find_dependency; src does not link protobuf directly
    sed -i '/include(FindProtobuf)/d; /find_package(Protobuf 3.0 REQUIRED)/d' CMakeLists.txt
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_LIBDIR=/usr/lib
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
