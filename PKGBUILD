# Maintainer: Ryan Algar <ryzer@arch-linux>
# Upstream: TheWaveWarden (Frederik Siepe) <info AT thewavewarden DOT com>

pkgname=odin2-synthesizer
pkgver=2.3.1
pkgrel=1
pkgdesc='24 voice polyphonic synthesizer, with modulation and FX. (Standalone, VST3, LV2)'
license=('GPL3')
arch=('x86_64')
url='https://www.thewavewarden.com/odin2'
provides=('odin2')
conflicts=('odin2-synthesizer-bin')

depends=('man-pages' 'ttf-font')
makedepends=('atk'
             'cairo'
             'doxygen'
             'gdk-pixbuf2'
             'gendesk'
             'git'
             'graphviz'
             'gtk3'
             'harfbuzz'
             'libfreetype.so=6-64'
             'libjpeg-turbo'
             'libpng'
             'libsoup'
             'libx11'
             'libxext'
             'libxinerama'
             'lv2'
             'pango'
             'python'
             'webkit2gtk')
optdepends=('ttf-dejavu: One of these may be needed for fonts to render correctly'
            'ttf-liberation: One of these may be needed for fonts to render correctly')

source=("${srcdir}/${pkgname%-synthesizer}::git+https://github.com/TheWaveWarden/odin2.git"
        "${srcdir}/JUCE::git+https://github.com/lv2-porting-project/JUCE.git"
        'AppConfig.patch'
        'Makefile.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
backup=('opt/odin2/odin2.conf' 'opt/odin2/Soundbanks/User Patches')
install='.install'

prepare() {
    # Checkout the correct branch of JUCE, and build Projucer
    cd "${srcdir}/JUCE"
    git checkout -q b13af2df9530bf473ff9a85936e5700027bd2af4
    cd extras/Projucer/Builds/LinuxMakefile
    make -j"$(nproc)" CONFIG=Release

    # Export Odin 2 build files with Projucer
    git checkout lv2
    git checkout -q f00a420bc348d79c4688b33b2b905b8ca0f25a3a
    export GDK_BACKEND=x11
    build/Projucer --set-global-search-path linux defaultJuceModulePath "${srcdir}/JUCE/modules"
    build/Projucer --resave "${srcdir}/${pkgname%-synthesizer}/Odin.jucer"

    # Patch Odin 2 build files for LV2 Support
    patch -N "${srcdir}/${pkgname%-synthesizer}/JuceLibraryCode/AppConfig.h" "${srcdir}/AppConfig.patch"
    patch -N "${srcdir}/${pkgname%-synthesizer}/Builds/LinuxMakefile/Makefile" "${srcdir}/Makefile.patch"
}

build() {
    cd "${srcdir}/odin2/Builds/LinuxMakefile"
    git checkout v2.3.1
    git submodule update --init --recursive
    make clean
    make CONFIG=Release -j"$(nproc)"
}

check() {
    cd "${srcdir}/odin2/Builds/LinuxMakefile/build"
    [[ -d Odin2.vst3 && -d Odin2_.lv2 ]] || return 1
}

package() {
    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2.vst3/Contents/x86_64-linux/Odin2.so" "${pkgdir}/usr/lib/vst3/Odin2.vst3/Contents/x86_64-linux/Odin2.so"

    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/Odin2_.so" "${pkgdir}/usr/lib/lv2/Odin2.lv2/Odin2_.so"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/Odin2_.ttl" "${pkgdir}/usr/lib/lv2/Odin2.lv2/Odin2_.ttl"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/presets.ttl" "${pkgdir}/usr/lib/lv2/Odin2.lv2/presets.ttl"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/manifest.ttl" "${pkgdir}/usr/lib/lv2/Odin2.lv2/manifest.ttl"

    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2" "${pkgdir}/usr/bin/odin2-synthesizer"
}
