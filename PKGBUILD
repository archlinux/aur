# Maintainer: Ryan Algar <ryzer@arch-linux>
# Upstream: TheWaveWarden (Frederik Siepe) <info AT thewavewarden DOT com>

pkgname=odin2
pkgver=2.2.4
pkgrel=1
pkgdesc='24 voice polyphonic synthesizer, with modulation and FX. (Standalone, VST3, LV2)'
license=('GPL3')
arch=('x86_64')
url='https://www.thewavewarden.com/odin2'
#conflicts=('odin2-bin')

depends=(ttf-font)
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

source=("${srcdir}/${pkgname}::git+https://github.com/TheWaveWarden/odin2.git"
        "${srcdir}/JUCE::git+https://github.com/lv2-porting-project/JUCE.git"
        'AppConfig.patch'
        'Makefile.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

backup=('opt/odin2/odin2.conf' 'opt/odin2/Soundbanks/User Patches')


prepare() {
    # Checkout the 6.0.1 branch of JUCE, and build Projucer
    cd "${srcdir}/JUCE"
    git checkout -q a30f7357863a7d480a771e069abf56909cdf0e13
    cd extras/Projucer/Builds/LinuxMakefile
    make -j"$(nproc)" CONFIG=Release

    # Export Odin 2 build files with Projucer
    git checkout lv2
    git checkout -q c51d03f11be20cb35eb28e8016e9a81827b50339
    export GDK_BACKEND=x11
    build/Projucer --set-global-search-path linux defaultJuceModulePath "${srcdir}/JUCE/modules"
    build/Projucer --resave "${srcdir}/${pkgname}/Odin.jucer"

    # Patch Odin 2 build files for LV2 Support
    patch -N "${srcdir}/${pkgname}/JuceLibraryCode/AppConfig.h" "${srcdir}/AppConfig.patch"
    patch -N "${srcdir}/${pkgname}/Builds/LinuxMakefile/Makefile" "${srcdir}/Makefile.patch"
}

pkgver() {
    "${srcdir}/JUCE/extras/Projucer/Builds/LinuxMakefile/build/Projucer" --get-version "${srcdir}/${pkgname}/Odin.jucer"
}

build() {
    cd "${srcdir}/odin2/Builds/LinuxMakefile"
    make clean
    make CONFIG=Release -j"$(nproc)"
}

check() {
    cd "${srcdir}/odin2/Builds/LinuxMakefile/build"
    [[ -d Odin2.vst3 && -d Odin2_.lv2 ]] || return 1
}

package() {
    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2.vst3/Contents/x86_64-linux/Odin2.so" "${pkgdir}/usr/lib/vst3/odin2"

    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/Odin2_.so" "${pkgdir}/usr/lib/lv2/odin2/Odin2.so"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/Odin2_.ttl" "${pkgdir}/usr/lib/lv2/odin2/Odin2.ttl"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/presets.ttl" "${pkgdir}/usr/lib/lv2/odin2/presets.ttl"
    install -Dm 644 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2_.lv2/manifest.ttl" "${pkgdir}/usr/lib/lv2/odin2/manifest.ttl"

    install -Dm 755 "${srcdir}/odin2/Builds/LinuxMakefile/build/Odin2" "${pkgdir}/usr/bin/Odin2"

    mkdir -pm 777 "${pkgdir}/opt/odin2" "${pkgdir}/opt/odin2/Soundbanks/User Patches"
    install -d "${srcdir}/odin2/Soundbanks/Factory Presets" "${pkgdir}/opt/odin2/Soundbanks/Factory Presets"

    rm -rf ${srcdir}
}
