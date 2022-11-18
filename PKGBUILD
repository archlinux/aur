# Edit on github: https://github.com/LizardByte/Sunshine/tree/nightly/packaging/linux/aur/PKGBUILD
# Reference: https://wiki.archlinux.org/title/PKGBUILD

pkgname=sunshine
pkgver=0.15.0
pkgrel=1
pkgdesc="Sunshine is a Gamestream host for Moonlight."
arch=('x86_64' 'i686')
url=https://app.lizardbyte.dev
license=('GPL3')

depends=('avahi' 'boost-libs' 'curl' 'ffmpeg4.4' 'libevdev' 'libpulse' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'openssl' 'opus' 'udev')
makedepends=('boost' 'cmake' 'git' 'make')
optdepends=('cuda' 'libcap' 'libdrm')

provides=()
conflicts=()

source=("$pkgname::git+https://github.com/LizardByte/Sunshine.git#commit=4cbf8c01d2f351922e170139fafe26a701c60342")
sha256sums=('SKIP')

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
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D SUNSHINE_ASSETS_DIR="share/sunshine" \
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
    make -C build install DESTDIR="$pkgdir"
}
