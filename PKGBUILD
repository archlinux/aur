# Maintainer: username227 [gfrank227 [at] gmail [dot] com
# Stable release package built from the unified source archive.

pkgname=viper4linux-re
pkgver=1.1.0
pkgrel=1
pkgdesc='ViPERDSP audio effects for PipeWire with a Qt6 interface'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('MIT' 'LicenseRef-ViPERDSP')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python')
makedepends=('cmake' 'pkgconf')
conflicts=('viper4linux-re-git' 'viper4linux' 'viper4linux-git')
source=("https://github.com/username227/viper4linux-re/releases/download/v${pkgver}/viper4linux-re-${pkgver}-unified-source.tar.xz")
sha256sums=('ba82c2e70d5e77202e05e7968ec958c89d71b11a4a0a099254eee636b4e78ef4')

prepare() {
    local tree="$srcdir/viper4linux-re-$pkgver"
    local dsp="$srcdir/ViPERDSP-patched"
    cp -a -- "$tree/third_party/ViPERDSP" "$dsp"
    VIPERDSP_SOURCE_DIR="$dsp" python3 "$tree/patches/fix_lufs_speed.py"
    VIPERDSP_SOURCE_DIR="$dsp" python3 "$tree/patches/preallocate_stereo_imager.py"
    VIPERDSP_SOURCE_DIR="$dsp" python3 "$tree/patches/preallocate_multiband_compressor.py"
}

build() {
    cmake -S "$srcdir/viper4linux-re-$pkgver" -B "$srcdir/viper4linux-build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DVIPERDSP_SOURCE_DIR="$srcdir/ViPERDSP-patched"
    cmake --build "$srcdir/viper4linux-build" --parallel "$(nproc)"
}

check() {
    cd "$srcdir/viper4linux-re-$pkgver"
    bash tests/check-package.sh
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" | grep -Eq ' [TW] ladspa_descriptor$'
}

package() {
    local tree="$srcdir/viper4linux-re-$pkgver"
    local built="$srcdir/viper4linux-build"

    bash "$tree/packaging/arch/install-package.sh" \
        "$tree" "$built" "$pkgdir" "$pkgname"
}
