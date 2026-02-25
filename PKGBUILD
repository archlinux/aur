# Maintainer: aik2 <aik2 at aik2 dot site>

pkgname='plugdata-git'
_name='plugdata'
pkgdesc='Plugin wrapper around Pure Data with a new JUCE GUI, allowing patching in DAWs'
pkgver=r10166.b1c5576
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxcursor' 'libxi' 'alsa-lib' 'curl' 'jack' 'fontconfig' 'libxkbcommon' 'wayland' 'libdecor' 'freeglut' 'mesa' 'glfw-x11' 'glew' 'openssl')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'python' 'pkgconf' 'unzip')
optdepends=()
provides=($_name)
conflicts=($_name)
arch=('x86_64')
url='https://github.com/plugdata-team/plugdata/'
license=('GPL3')
source=("git+https://github.com/plugdata-team/plugdata.git#branch=develop"
    "${_name}.desktop"
    "${_name}.png")
sha512sums=('SKIP'
    '1a64e0abbc5e2e9417bf3e2d7f0186b8137a92cebf2123adff550dba53468588c46200f5f40056fad745d583282e1bdd903da14dc064846f91309dc570bc25e3'
    '6ed1228803ea10d51e793f6c8f008b87465314a1f6484121745e42f84fe7b443a8319fcdba862b17af2a1a8b04b7275c0d69eb7a07d0841676f671d25e0790b4')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${_name}"
    git submodule update --init --recursive --depth=1

    # Disable VDPAU in FFmpeg to avoid linking issues
    sed -i 's/--disable-vaapi/--disable-vaapi --disable-vdpau/' Libraries/pd-else/Source/Shared/ffmpeg/build_ffmpeg.sh
}

build() {
    cd "${srcdir}/${_name}"
    CXX=g++ cmake -Bbuild -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=TRUE \
        -DENABLE_WAYLAND=1
    cmake --build build --config Release
}

package() {
    # Desktop entry & pixmaps
    install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    cd "${srcdir}/${_name}"

    # Plugin formats (LV2/VST3 are directories; CLAP is flat files + resources.bin)
    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find ./Plugins -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find ./Plugins -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    mkdir -p "${pkgdir}/usr/lib/clap/"
    cp -ar Plugins/CLAP/. "${pkgdir}/usr/lib/clap/"

    # Standalone binary; keep it in /usr/lib so resources.bin sits beside it
    mkdir -p "${pkgdir}/usr/lib/${_name}/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -ar Plugins/Standalone/. "${pkgdir}/usr/lib/${_name}/"
    ln -sr "${pkgdir}/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

    # Each plugin format ships its own resources.bin (~21MB) that it looks up
    # relative to itself. Install one canonical copy and symlink all others to
    # avoid duplicating ~126MB across the six locations.
    install -Dm644 "Plugins/Standalone/${_name}-resources.bin" \
        "${pkgdir}/usr/share/${_name}/${_name}-resources.bin"
    find "${pkgdir}" -name "${_name}-resources.bin" \
        ! -path "${pkgdir}/usr/share/*" | while read -r f; do
        ln -srf "${pkgdir}/usr/share/${_name}/${_name}-resources.bin" "$f"
    done
}
