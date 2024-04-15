# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=codecserver-mbelib-module-git
pkgver=r7.dae3eb4
pkgrel=1
pkgdesc="Software MBE decoder for codecserver / digiham / openwebrx"
arch=(x86_64 aarch64)
url="https://github.com/fventuri/codecserver-mbelib-module"
license=('GPL3')
provides=('codecserver-mbelib-module')
conflicts=('codecserver-mbelib-module')
depends=('glibc' 'gcc-libs' 'mbelib' 'protobuf' 'codecserver')
makedepends=('git' 'cmake' 'patch')
source=(
  "$pkgname"::git+https://github.com/fventuri/codecserver-mbelib-module.git
  change_cppversion.patch
)
sha256sums=('SKIP' 'ef5fe46aa0a4882d1dcc51e1f265318298386ab76e4e2c6543ec5261c754e1be')

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
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_LIBDIR=/usr/lib
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
