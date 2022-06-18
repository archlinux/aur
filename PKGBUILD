# Maintainer: Ryan Algar <ryzer@arch-linux>
# Upstream: TheWaveWarden (Frederik Siepe) <info AT thewavewarden DOT com>

pkgname=odin2-synthesizer
pkgver=2.3.3
pkgrel=1
pkgdesc='24 voice polyphonic synthesizer, with modulation and FX. (Standalone, VST3, LV2, CLAP)'
license=('GPL3')
arch=('x86_64')
url='https://www.thewavewarden.com/odin2'
provides=('odin2-synthesizer')
conflicts=('odin2-synthesizer-bin')

depends=('man-pages' 'ttf-font')
makedepends=('alsa-lib'
             'cmake'
             'curl'
             'git'
             'libx11'
             'lv2'
             'mesa'
             'webkit2gtk')
optdepends=('ttf-dejavu: One of these may be needed for fonts to render correctly'
            'ttf-liberation: One of these may be needed for fonts to render correctly')

source=(
    "git+https://github.com/TheWaveWarden/odin2.git"
    "add-missing-include.patch")
sha256sums=('SKIP' 'SKIP')
backup=('opt/odin2/odin2.conf' 'opt/odin2/Soundbanks/User Patches')
install='.install'

prepare() {

    # Checkout the correct branch and generate the build files
    cd "${srcdir}/odin2"
    git checkout -q v2.3.3
    git submodule update --init --recursive
    cd "${srcdir}/odin2/libs/JUCELV2"
    git apply "${srcdir}/add-missing-include.patch"
    cd "${srcdir}/odin2"
    cmake -B build -D CMAKE_BUILD_TYPE=Release
}

build() {

    cd "${srcdir}/odin2"
    cmake --build build --config Release
}

check() {

    local _outdir="${srcdir}/odin2/build/Odin2_artefacts/Release"

    # VST3
    [[ -f $_outdir/VST3/Odin2.vst3/Contents/x86_64-linux/Odin2.so ]]

    # LV2
    for _file in manifest.ttl Odin2.so Odin2.ttl presets.ttl ; do
        [[ -f $_outdir/LV2/Odin2.lv2/$_file ]]
    done

    # CLAP
    [[ -f $_outdir/CLAP/Odin2.clap ]]

    # Standalone
    [[ -f $_outdir/Standalone/Odin2 ]]
}

package() {

    local _outdir="${srcdir}/odin2/build/Odin2_artefacts/Release"

    # VST3
    install -Dm 755 "$_outdir/VST3/Odin2.vst3/Contents/x86_64-linux/Odin2.so" \
        "${pkgdir}/usr/lib/vst3/Odin2.vst3/Contents/x86_64-linux/Odin2.so"

    # LV2
    install -Dm 755 "$_outdir/LV2/Odin2.lv2/Odin2.so" \
        "${pkgdir}/usr/lib/lv2/Odin2.lv2/Odin2.so"
    install -Dm 644 "$_outdir/LV2/Odin2.lv2/Odin2.ttl" \
        "${pkgdir}/usr/lib/lv2/Odin2.lv2/Odin2.ttl"
    install -Dm 644 "$_outdir/LV2/Odin2.lv2/presets.ttl" \
        "${pkgdir}/usr/lib/lv2/Odin2.lv2/presets.ttl"
    install -Dm 644 "$_outdir/LV2/Odin2.lv2/manifest.ttl" \
        "${pkgdir}/usr/lib/lv2/Odin2.lv2/manifest.ttl"

    # CLAP
    install -Dm 755 "$_outdir/CLAP/Odin2.clap" \
        "${pkgdir}/usr/lib/clap/Odin2.clap"

    # Standalone
    install -Dm 755 "$_outdir/Standalone/Odin2" \
        "${pkgdir}/usr/bin/odin2-synthesizer"
}
