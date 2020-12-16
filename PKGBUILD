# Maintainer: EHfive <eh5@sokka.cn>

pkgname=pulseaudio-modules-bt-git
pkgver=14.0.r149.dbb5164
pkgrel=2
epoch=1
pkgdesc="PulseAudio Bluetooth modules with SBC, AAC, APTX, APTX-HD, Sony LDAC (A2DP codec) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio" "bluez" "bluez-libs" "sbc" "libfdk-aac.so")
makedepends=("libpulse" "cmake>=3.0" "libavcodec.so>=58" "libldac" "git")
optdepends=("libavcodec.so>=58: aptX Classic, aptX HD support"
            "libldac: LDAC support")
provides=("pulseaudio-bluetooth")
conflicts=("pulseaudio-bluetooth")

source=("git+https://github.com/EHfive/pulseaudio-modules-bt.git"
        "git+https://github.com/pulseaudio/pulseaudio.git")

md5sums=('SKIP' 'SKIP')

get_pulseaudio_version() {
    pulseaudio_version=`pkg-config libpulse --modversion|sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
}

prepare() {
    get_pulseaudio_version
    cd "$srcdir/pulseaudio-modules-bt"
    rm -rf pa
    ln -sf -T "../pulseaudio" "pa"
    git -C pa checkout v$pulseaudio_version
}

pkgver() {
    cd "$srcdir/pulseaudio-modules-bt"
    printf "%s.r%s.%s" "$pulseaudio_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/pulseaudio-modules-bt"
    rm -rf build && mkdir build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -S .. \
        -B . \
        
    make
}

package() {
    cd "$srcdir/pulseaudio-modules-bt/build"
    make DESTDIR="$pkgdir" install
}
