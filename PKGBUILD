pkgname=dsd-neo-git
pkgver=2.4.0.r25.g6b75a69
pkgrel=1
pkgdesc="Digital Speech Decoder - A modern, modular, and performance enhanced C/C++ decoder for digital voice. DMR, P25, NXDN, YSF, and more."
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/dsd-neo"
license=('GPL-3.0-or-later')
depends=(
    'mbelib-neo-git'
    'libsndfile'
    'openssl'
    'ncurses'
    'libpulse'
    'rtl-sdr'
    'soapysdr'
    'codec2'
    'curl'
)
makedepends=(
    'git'
    'cmake'
    'help2man'
)
provides=('dsd-neo')
conflicts=('dsd-neo')
source=("${pkgname}::git+https://github.com/arancormonk/dsd-neo.git#branch=main")
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
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
