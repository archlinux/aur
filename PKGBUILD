# Maintainer: username227 [gfrank227 [at] gmail [dot] com
# Stable release package built from the unified source archive.

pkgname=viper4linux-re
pkgver=1.0.0
pkgrel=1
pkgdesc='ViPERDSP audio effects for PipeWire with a Qt6 interface'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('MIT' 'LicenseRef-ViPERDSP')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python')
makedepends=('cmake' 'pkgconf')
conflicts=('viper4linux-re-git' 'viper4linux' 'viper4linux-git')
source=("https://github.com/username227/viper4linux-re/releases/download/v${pkgver}/viper4linux-re-${pkgver}-unified-source.tar.xz")
sha256sums=('5f22df6e4387bc73d80614c2a539e2fb668aa2a08a8a73c9db63ad8e49c5646d')

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
    bash tests/check-mock.sh
    python3 tests/check-launcher.py
    python3 tests/check-theme-contract.py
    python3 tests/check-ui-contract.py
    python3 tests/check-tray-contract.py
    python3 tests/check-named-presets-contract.py
    python3 tests/check-preset-reset-contract.py
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" | grep -Eq ' [TW] ladspa_descriptor$'
}

package() {
    local tree="$srcdir/viper4linux-re-$pkgver"
    local built="$srcdir/viper4linux-build"

# Executables
    install -Dm755 "$built/viper-gui" "$pkgdir/usr/bin/viper4linux-gui"
    install -Dm755 "$built/viper-ctl" "$pkgdir/usr/bin/viper4linux-ctl"

# Libraries
    install -Dm755 "$built/viper_dsp_ladspa.so" "$pkgdir/usr/lib/ladspa/viper_dsp_ladspa.so"

# Launchers
    install -Dm644 "$tree/src/viper_launcher.py" "$pkgdir/usr/lib/viper4linux/viper_launcher.py"
    install -Dm755 "$tree/packaging/arch/start-backend" "$pkgdir/usr/lib/viper4linux/start-backend"
    install -Dm755 "$tree/packaging/arch/viper4linux" "$pkgdir/usr/bin/viper4linux"

# Pipewire Routing Configuration
    install -Dm644 "$tree/routing-config/filter-chain.conf.d/99-viper-smart.conf" "$pkgdir/usr/share/viper4linux/routing-config/filter-chain.conf.d/99-viper-smart.conf"

# Desktop File
    install -Dm644 "$tree/packaging/arch/viper4linux.desktop" "$pkgdir/usr/share/applications/viper4linux.desktop"

# Icons
    install -Dm644 "$tree/resources/viper4linux-blue.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/viper4linux.png"
    install -Dm644 "$tree/resources/viper4linux-blue.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/viper4linux.svg"

# Man Pages
    install -Dm644 "$tree/man/viper4linux.1" "$pkgdir/usr/share/man/man1/viper4linux.1"
    install -Dm644 "$tree/man/viper4linux-ctl.1" "$pkgdir/usr/share/man/man1/viper4linux-ctl.1"

# License and Third-Party Notices
    install -Dm644 "$tree/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$tree/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/ViPERDSP-NOTICE.md"

# Documentation
    install -Dm644 "$tree/README.md" "$pkgdir/usr/share/doc/viper4linux/README.md"
    install -d "$pkgdir/usr/share/doc/viper4linux/docs"
    cp -a "$tree/docs/." "$pkgdir/usr/share/doc/viper4linux/docs/"
}
