# Maintainer: Yamada Hayao <hayao@fascode.net>
# Maintainer: EHfive <eh5@sokka.cn>

pkgname=pulseaudio-modules-bt
pkgver=1.4
pulseaudio_ver=13.99.2
pkgrel=2
pkgdesc="PulseAudio Bluetooth modules with SBC, AAC, APTX, APTX-HD, Sony LDAC (A2DP codec) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "bluez" "bluez-libs" "sbc" "libfdk-aac.so")
makedepends=("cmake>=3.0" "libavcodec.so>=58" "libldac" "git")
optdepends=("libavcodec.so>=58: aptX Classic, aptX HD support"
            "libldac: LDAC support")
provides=("pulseaudio-bluetooth" "pulseaudio-modules-bt-git")
conflicts=("pulseaudio-bluetooth" "pulseaudio-modules-bt-git")

source=("https://github.com/EHfive/pulseaudio-modules-bt/archive/v${pkgver}.zip"
        "https://github.com/pulseaudio/pulseaudio/archive/v${pulseaudio_ver}.zip")

md5sums=(
    '711a7f930321e56706acdb441de0e432'
    '6f04e194199f39ffba0b026a770e990d'
)

sha512sums=(
    "5c3ed59dec46a1a9cc2f359ac1d28a82a50a5dea47a268a10601b95a8e17a68dd00ba7628c429271349bae290f461abeb1a4a3715b1833c71d7f82f9a902fe2d"
    "61b24aac1b722cd611be88241551e6b345532b55d9f718ae784ec6eee135d7ba8460ea83b4c2de5b970e8af4af39c32255ff170f026156b0d22c988bc5499a6a"
)

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
