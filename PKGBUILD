# Maintainer: Sighthesia <sighthesia@qq.com>
# Contributor: Based on zl-equalizer-bin by Andrej Radović

pkgname=zl-compressor-bin
_pkgname=ZL.Compressor
pkgver=0.2.1
pkgrel=1
pkgdesc="Versatile dynamic range compressor audio plugin by ZL-Audio, featuring lookahead, sidechain"
arch=('x86_64' 'aarch64')
url="https://github.com/ZL-Audio/ZLCompressor"
license=('AGPL-3.0-only')
provides=('zl-compressor')
conflicts=('zl-compressor')

# Runtime dependencies - libraries required for the plugin to function
depends=(
    'alsa-lib'
    'freetype2'
    'fontconfig'
    'gcc-libs'
    'glibc'
)

# Package provides and conflicts
provides=('zl-compressor')
conflicts=('zl-compressor')

# Build options - don't strip binaries to preserve plugin functionality
options=(!strip)

# Source files - architecture-specific downloads and license
source=(
    "LICENSE.md::https://raw.githubusercontent.com/ZL-Audio/ZLCompressor/main/LICENSE.md"
)
# Architecture-specific source files
source_x86_64=("${_pkgname}-${pkgver}-Linux.zip::https://github.com/ZL-Audio/ZLCompressor/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux-x86.zip")
source_aarch64=("${_pkgname}-${pkgver}-Linux-arm.zip::https://github.com/ZL-Audio/ZLCompressor/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux-arm.zip")

# SHA256 checksums for source integrity verification
sha256sums=('a96fd9920a72e79720d41bcf32ccd58634194aa01ee82f246a72392015d626e9')
sha256sums_x86_64=('f02bbb101c1d09eb708b2a17d8a0276b3a2871c66e76680f3afb44d18a06a82a')
sha256sums_aarch64=('cb4c11b025c07e67fd045e0cc2ece0d6fb4972eaaab5f715c381afb41eb4ae04')

# Architecture-specific checksums

package() {
    # Create plugin installation directories
    install -dm755 "${pkgdir}/usr/lib/vst3"    # VST3 plugin directory
    install -dm755 "${pkgdir}/usr/lib/lv2"     # LV2 plugin directory

    # Install VST3 plugin (Virtual Studio Technology 3.0 format)
    cp -a "${srcdir}/VST3/ZL Compressor.vst3" "${pkgdir}/usr/lib/vst3/ZLCompressor.vst3"

    # Install LV2 plugin (LADSPA Version 2 format for Linux audio)
    cp -a "${srcdir}/LV2/ZL Compressor.lv2" "${pkgdir}/usr/lib/lv2/ZLCompressor.lv2"

    # Install standalone application executable
    install -Dm755 "${srcdir}/Standalone/ZL Compressor" "${pkgdir}/usr/bin/zlcompressor"

    # Install license file for legal compliance - corrected filename
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
