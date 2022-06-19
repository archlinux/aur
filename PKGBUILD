# Edit on github: https://github.com/SunshineStream/Sunshine/tree/nightly/packaging/linux/aur/PKGBUILD
# Reference: https://wiki.archlinux.org/title/PKGBUILD

pkgname=sunshine-git
pkgver=0.14.0
pkgrel=1
pkgdesc="Sunshine is a Gamestream host for Moonlight."
arch=('x86_64' 'i686')
url=https://sunshinestream.github.io
license=('GPL3')

depends=('boost-libs' 'ffmpeg4.4' 'libpulse' 'libevdev' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'openssl' 'opus' 'udev')
makedepends=('git' 'cmake' 'boost' 'make')

provides=('sunshine')
conflicts=("sunshine")

source=("$pkgname::git+https://github.com/SunshineStream/Sunshine.git#tag=v$pkgver")
sha256sums=('SKIP')
install=sunshine.install

prepare() {
    cd "$pkgname"
    git submodule update --recursive --init
}

build() {
    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$pkgname" \
        -B build \
        -Wno-dev \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D CMAKE_INSTALL_PREFIX="$pkgdir" \
        -D SUNSHINE_ASSETS_DIR="local/sunshine/assets" \
        -D SUNSHINE_CONFIG_DIR="local/sunshine/config" \
        -D LIBAVCODEC_INCLUDE_DIR=/usr/include/ffmpeg4.4 \
        -D LIBAVCODEC_LIBRARIES=/usr/lib/ffmpeg4.4/libavcodec.so \
        -D LIBAVDEVICE_INCLUDE_DIR=/usr/include/ffmpeg4.4 \
        -D LIBAVDEVICE_LIBRARIES=/usr/lib/ffmpeg4.4/libavdevice.so \
        -D LIBAVFORMAT_INCLUDE_DIR=/usr/include/ffmpeg4.4 \
        -D LIBAVFORMAT_LIBRARIES=/usr/lib/ffmpeg4.4/libavformat.so \
        -D LIBAVUTIL_INCLUDE_DIR=/usr/include/ffmpeg4.4 \
        -D LIBAVUTIL_LIBRARIES=/usr/lib/ffmpeg4.4/libavutil.so \
        -D LIBSWSCALE_INCLUDE_DIR=/usr/include/ffmpeg4.4 \
        -D LIBSWSCALE_LIBRARIES=/usr/lib/ffmpeg4.4/libswscale.so

    make -C build
}

package() {
    make install
}
