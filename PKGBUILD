# Maintainer: diginatu <diginatu.510o@gmail.com>
pkgname=fcitx5-voice-input-git
pkgver=r22.f0bc085
pkgrel=1
pkgdesc="Fcitx5 addon for voice input via Whisper-compatible speech recognition"
arch=('x86_64' 'aarch64')
url="https://github.com/diginatu/fcitx5-voice-input"
license=('MIT')
depends=('fcitx5' 'libpulse' 'curl')
makedepends=('cmake' 'ninja' 'git' 'pkgconf')
provides=('fcitx5-voice-input')
conflicts=('fcitx5-voice-input')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fcitx5-voice-input"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$srcdir/fcitx5-voice-input" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=0
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
