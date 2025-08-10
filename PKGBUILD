# Maintainer: Sighthesia <sighthesia@qq.com>
# Contributor: Based on zl-equalizer-bin by Andrej Radović

pkgname=zl-compressor-bin
_pkgname=ZL.Compressor
pkgver=0.2.0
pkgrel=1
pkgdesc="Versatile dynamic range compressor audio plugin by ZL-Audio, featuring lookahead, sidechain"
arch=('x86_64' 'aarch64')
url="https://github.com/ZL-Audio/ZLCompressor"
license=('AGPL3')

# Runtime dependencies - libraries required for the plugin to function
depends=(
    'gcc-libs'      # C++ standard library and GCC runtime: libstdc++.so.6, libgcc_s.so.1
    'glibc'         # GNU C Library: libc.so.6, libm.so.6
    'alsa-lib'      # Advanced Linux Sound Architecture library: libasound.so.2
    'fontconfig'    # Font configuration library: libfontconfig.so.1
    'freetype2'     # Font rendering library: libfreetype.so.6
    'expat'         # XML parsing library: libexpat.so.1
    'zlib'          # Compression library: libz.so.1
    'bzip2'         # Compression library: libbz2.so.1.0
    'libpng'        # PNG image library: libpng16.so.16
    'harfbuzz'      # Text shaping library: libharfbuzz.so.0
    'brotli'        # Compression library: libbrotlidec.so.1, libbrotlicommon.so.1
    'glib2'         # Low-level system library: libglib-2.0.so.0
    'graphite'      # Font rendering engine: libgraphite2.so.3
    'pcre2'         # Perl Compatible Regular Expressions: libpcre2-8.so.0
)

# Package provides and conflicts
provides=('zlcompressor')
conflicts=('zlcompressor')

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
sha256sums=(
    'a96fd9920a72e79720d41bcf32ccd58634194aa01ee82f246a72392015d626e9'  # LICENSE.md
)

# Architecture-specific checksums
sha256sums_x86_64=('372f78b6cd388eaa0ee0dcc26ce446a4daf321fc177d9515195918a1003ea52b')  # x86_64 zip
sha256sums_aarch64=('6c4b7e1f8277d2d5cae24510143bc8c4768210851db844ccf61361450930e19a')  # aarch64 zip

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