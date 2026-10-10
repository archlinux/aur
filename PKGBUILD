# Maintainer: Vinicius Moura Longaray <vmouralongaray@gmail.com>
pkgname=spectrum-git
pkgver=r282.3086210
pkgrel=1
pkgdesc="Console-based music player with equalizer written in C++."
arch=("x86_64")
url="https://github.com/v1nns/spectrum"
license=("MIT")
depends=("alsa-lib" "ffmpeg" "fftw" "curl" "libxml++")
makedepends=("git" "cmake" "ninja")
optdepends=("yt-dlp: play songs from YouTube")
provides=("spectrum")
conflicts=("spectrum")
source=("spectrum::git+https://github.com/v1nns/spectrum")
md5sums=("SKIP")
options=("strip" "!debug")

pkgver() {
    cd "$srcdir/spectrum"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/spectrum"
    mkdir -p build && cd build
    CXXFLAGS="$CFLAGS" cmake \
        -DENABLE_INSTALL=ON \
        -DSPECTRUM_DEBUG=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_COVERAGE=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja \
        ..

    cmake --build .
}

package() {
    cd "$srcdir/spectrum"
    cd build
    DESTDIR="$pkgdir/" cmake --install . --component runtime
}
