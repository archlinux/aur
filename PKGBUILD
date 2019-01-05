# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=faster-git
pkgver=c4a2c68
pkgrel=1
pkgdesc="Fast key-value store from Microsoft Research"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://github.com/Microsoft/FASTER"
license=('MIT')
depends=('libutil-linux' 'intel-tbb' 'libaio')
makedepends=('git' 'cmake' 'libutil-linux' 'intel-tbb' 'libaio')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('faster::git+https://github.com/Microsoft/FASTER.git' 'faster.pc')
sha256sums=('SKIP'
            '2884de68e2be2f3c20f348197345380834ffcb5b886dca010deb39f9c5eb32ba')
noextract=()

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    mkdir -p "$srcdir/${pkgname%-git}/cc/build/Release"
    cd "$srcdir/${pkgname%-git}/cc/build/Release"
    cmake -DCMAKE_BUILD_TYPE=Release ../..
}

build() {
    cd "$srcdir/${pkgname%-git}/cc/build/Release"
    make
}

check() {
    cd "$srcdir/${pkgname%-git}/cc/build/Release"
    ./utility_test
    ./in_memory_test
    # ./malloc_fixed_page_size_test
    # ./paging_queue_test
    # ./recovery_queue_test
}

package() {
    cd "$srcdir/${pkgname%-git}/cc"
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/lib/pkgconfig"
    install -Dm644 ../../../faster.pc "$pkgdir/usr/lib/pkgconfig"
    install -Dm444 build/Release/libfaster.a "$pkgdir/usr/lib"
    for i in `find src -name "*.h"` ; do
      install -Dm644 $i "$pkgdir/usr/include/${pkgname%-git}/${i#*/}"
    done
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
