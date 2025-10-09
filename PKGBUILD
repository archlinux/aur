# Maintainer: rileyaft <riley.aft at outlook dot com>

pkgname=librepods-git
pkgver=nightly.d9469c2.r6.g28ffd21 # additonally pulls from pkgver()
pkgrel=1
pkgdesc="Apple exclusive AirPods Pro 2 features for Linux (unofficial package)"
arch=('x86_64')
url="https://github.com/kavishdevar/librepods"
license=('AGPL3')
depends=(
    'qt6-base'
    'qt6-connectivity'
    'qt6-multimedia-ffmpeg'
    'qt6-multimedia'
    'libpulse'
)
makedepends=(
    'cmake'
    'make'
    'openssl'
    'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=()
md5sums=()
install="${pkgname}.install"

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() { # Done to avoid large download in other subdirectories
    cd "$srcdir"
    git clone --filter=blob:none --sparse "$url" "${pkgname}"
    cd "${pkgname}"
    git sparse-checkout set linux
}

build() {
    cd "$srcdir/${pkgname}/linux"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j "$(nproc)"
}

package() {
    cd "$srcdir/${pkgname}/linux/build"
    install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
