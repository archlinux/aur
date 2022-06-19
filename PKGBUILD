# Maintainer: aik2 aik2mlj@gmail.com

pkgname='plugdata-git'
_name='plugdata'
pkgdesc='Plugin wrapper around PureData with a new GUI made with JUCE, allowing patching in DAWs'
pkgver=r985.63e51bb2
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=('git' 'cmake')
optdepends=()
arch=('x86_64' 'aarch64')
url='https://github.com/timothyschoen/PlugData'
license=('GPL3')
source=("git+https://github.com/timothyschoen/PlugData/")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/PlugData"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/PlugData"
    git submodule update --init --recursive --depth=1
}

build () {
    cd "${srcdir}/PlugData"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles" ..
    cmake --build .
}

package () {
    # Desktop entry & pixmaps
    install -Dm644 "${srcdir}/../${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${srcdir}/../${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    cd "${srcdir}/PlugData"

    # === modified from .github/scripts/package.sh ===
    # rm -rf Packaged
    # cp -r Plugins PlugData

    # mkdir PlugData/LV2/PlugData.lv2

    # ./Plugins/LV2/lv2_file_generator PlugData/LV2/PlugData_LV2.so PlugData
    # mv PlugData/LV2/PlugData_LV2.so PlugData/LV2/PlugData.lv2/PlugData.so

    # mv manifest.ttl PlugData/LV2/PlugData.lv2/manifest.ttl
    # mv presets.ttl PlugData/LV2/PlugData.lv2/presets.ttl
    # mv PlugData.ttl PlugData/LV2/PlugData.lv2/PlugData.ttl

    # rm PlugData/LV2/lv2_file_generator

    # mv PlugData Packaged
    # rm -rf Plugins
    # ======

    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find ./Plugins -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find ./Plugins -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    install -Dm755 -T Plugins/Standalone/* "${pkgdir}/usr/bin/${_name}"
}
