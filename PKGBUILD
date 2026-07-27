pkgname=mbelib-neo-git
pkgver=2.0.0.r23.gef6734d
pkgrel=1
pkgdesc="P25 Phase 1 and ProVoice IMBE and Half-rate AMBE vocoder library (modernized fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/mbelib-neo"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake' 'git')
provides=("mbelib-neo=${pkgver}")
conflicts=('mbelib-neo')
options=('staticlibs')
source=("$pkgname::git+https://github.com/arancormonk/mbelib-neo.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --tags --match 'v[0-9]*' --abbrev=7 2>/dev/null |
            sed 's/^v//;s/-/.r/;s/-/./' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMBELIB_BUILD_TESTS=OFF \
        -DMBELIB_BUILD_EXAMPLES=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
