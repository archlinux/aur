# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: EHfive <eh5@sokka.cn>
# Contributar: tleydxdy https://aur.archlinux.org/packages/pulseaudio-modules-bt/#comment-786420

get_pulseaudio_version() {
    #printf "$(pkg-config libpulse --modversion|sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"
    #printf "$(pacman -Q "$(basename "${pulseaudio_pkgname}")" | cut -d ' ' -f 2 | cut -d '-' -f 1)"
    printf "$(pulseaudio --version | cut -d " " -f 2)"
}

#-- PulseAudio --#
pulseaudio_pkgname="pulseaudio"
pulseaudio_ver="$(get_pulseaudio_version)"

pkgname="pulseaudio-modules-bt"
module_ver="1.4"
pkgver="${module_ver}_${pulseaudio_ver}"
pkgrel="5"
pkgdesc="PulseAudio Bluetooth modules with SBC, AAC, APTX, APTX-HD, Sony LDAC (A2DP codec) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "bluez" "bluez-libs" "sbc" "libfdk-aac.so")
makedepends=("libpulse" "cmake>=3.0" "libavcodec.so>=58" "libldac")
optdepends=(
    "libavcodec.so>=58: aptX Classic, aptX HD support"
    "libldac: LDAC support"
    "pulseaudio=${pulseaudio_ver}: This package requires a specific PulseAudio version"
)
provides=("pulseaudio-bluetooth")
conflicts=("pulseaudio-bluetooth")

source=(
    "pulseaudio-modules-bt-${module_ver}.zip::https://github.com/EHfive/pulseaudio-modules-bt/archive/v${module_ver}.zip"
    "pulseaudio-${pulseaudio_ver}.zip::https://github.com/pulseaudio/pulseaudio/archive/v${pulseaudio_ver}.zip"
)

md5sums=(
    '711a7f930321e56706acdb441de0e432'
    'SKIP'
)

sha512sums=(
    "5c3ed59dec46a1a9cc2f359ac1d28a82a50a5dea47a268a10601b95a8e17a68dd00ba7628c429271349bae290f461abeb1a4a3715b1833c71d7f82f9a902fe2d"
    "SKIP"
)

pkgver() {
    printf "%s_%s" "${module_ver}" "$(get_pulseaudio_version)"
}

prepare() {
    cd "${srcdir}/pulseaudio-modules-bt-${module_ver}"
    rm -rf pa
    ln -sf -T "../pulseaudio-${pulseaudio_ver}" "pa"
}

build() {
    cd "${srcdir}/pulseaudio-modules-bt-${module_ver}"
    rm -rf build
    mkdir build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -S .. \
        -B . \

    make
}

package() {
    cd "${srcdir}/pulseaudio-modules-bt-${module_ver}/build"
    make DESTDIR="${pkgdir}" install
}
