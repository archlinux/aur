# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: EHfive <eh5@sokka.cn>

pkgname="pulseaudio-modules-bt"
pkgver="1.4"


#-- PulseAudio --#
pulseaudio_pkgname="extra/pulseaudio"
if pacman -Qq "$(basename "${pulseaudio_pkgname}")" 2> "/dev/null" 1>&2; then
    # If pulseaudio is installed, use the version of installed pulseaudio.
    pulseaudio_ver="$(pacman -Q "$(basename "${pulseaudio_pkgname}")" | cut -d ' ' -f 2 | cut -d '-'  -f 1)"
else
    # If pulseaudio is not installed, use the version from offcial repository.
    pulseaudio_ver="$(pacman -Sp --print-format '%v' "${pulseaudio_pkgname}" | cut -d '-' -f 1)"
fi

# if it is failed to get the version of pulseaudio, use the hard coded one.
if [[ -v pulseaudio_ver ]]; then
    pulseaudio_ver="14.0"
fi


pkgrel="5"
pkgdesc="PulseAudio Bluetooth modules with SBC, AAC, APTX, APTX-HD, Sony LDAC (A2DP codec) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "bluez" "bluez-libs" "sbc" "libfdk-aac.so")
makedepends=("libpulse" "cmake>=3.0" "libavcodec.so>=58" "libldac" "git")
optdepends=("libavcodec.so>=58: aptX Classic, aptX HD support"
            "libldac: LDAC support")
provides=("pulseaudio-bluetooth" "pulseaudio-modules-bt-git")
conflicts=("pulseaudio-bluetooth" "pulseaudio-modules-bt-git")

source=("pulseaudio-modules-bt.zip::https://github.com/EHfive/pulseaudio-modules-bt/archive/v${pkgver}.zip"
        "pulseaudio.zip::https://github.com/pulseaudio/pulseaudio/archive/v${pulseaudio_ver}.zip")

md5sums=(
    '711a7f930321e56706acdb441de0e432'
    'SKIP'
)

sha512sums=(
    "5c3ed59dec46a1a9cc2f359ac1d28a82a50a5dea47a268a10601b95a8e17a68dd00ba7628c429271349bae290f461abeb1a4a3715b1833c71d7f82f9a902fe2d"
    "SKIP"
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
