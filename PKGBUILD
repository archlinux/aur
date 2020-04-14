# Maintainer: Yamada Hayao <hayao@fascode.net>
# Maintainer: EHfive <eh5@sokka.cn>

pkgname=pulseaudio-modules-bt
pkgver=1.3
pulseaudio_ver=13.99.1
pkgrel=2
pkgdesc="PulseAudio Bluetooth modules with SBC, AAC, APTX, APTX-HD, Sony LDAC (A2DP codec) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "bluez" "bluez-libs" "sbc" "libfdk-aac.so")
makedepends=("cmake>=3.0" "libavcodec.so>=58" "libldac" "git")
optdepends=("libavcodec.so>=58: aptX Classic, aptX HD support"
            "libldac: LDAC support")
provides=("pulseaudio-bluetooth")
conflicts=("pulseaudio-bluetooth" "pulseaudio-modules-bt-git")

source=("https://github.com/EHfive/pulseaudio-modules-bt/archive/v${pkgver}.zip"
        "https://github.com/pulseaudio/pulseaudio/archive/v${pulseaudio_ver}.zip")

md5sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/pulseaudio-modules-bt-${pkgver}"
    rm -rf pa
    ln -sf -T "../pulseaudio-${pulseaudio_ver}" "pa"
    # git -C pa checkout v`pkg-config libpulse --modversion|sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
}

build() {
    cd "$srcdir/pulseaudio-modules-bt-${pkgver}"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        .
    make
}

package() {
    cd "$srcdir/pulseaudio-modules-bt-${pkgver}"
    make DESTDIR="$pkgdir" install
}
