# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=iridium-sniffer-git
pkgver=r150.2120cd6
pkgrel=2
pkgdesc="Standalone Iridium satellite burst detector and demodulator in C"
arch=(
    'x86_64'
    'armv7h'
    'aarch64'
)
url="https://github.com/alphafox02/iridium-sniffer"
license=('GPL-3.0-or-later')
depends=(
    'fftw'
    'glibc'
)
makedepends=(
    'cmake'
    'git'
)
optdepends=(
    'bladerf'
    'hackrf'
    'libacars'
    'libuhd'
    'libsdrplay'
    'soapysdr'
    'zeromq'
)
provides=(
    'iridium-sniffer'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    local cmake_options=(
      -B build
      -S "$pkgname"
      -W no-dev
      -D CMAKE_BUILD_TYPE=None
      -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

