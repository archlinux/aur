# Maintainer: username227 {gfrank227 [at] gmail [dot] com}
pkgname=viper4linux-re-git
pkgver=1.0.0.r34.g789a82b
pkgrel=1
pkgdesc='Reverse-engineered ViPERDSP effects for PipeWire with a Qt6 interface (development VCS build)'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('MIT' 'LicenseRef-ViPERDSP')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python')
makedepends=('git' 'cmake' 'pkgconf')
conflicts=('viper4linux-re' 'viper4linux' 'viper4linux-git')
provides=('viper4linux-re')
_app_git_url="${VIPER4LINUX_GIT_URL:-https://github.com/username227/viper4linux-re.git}"
source=("viper4linux::git+${_app_git_url}"
        "ViPERDSP::git+https://github.com/likelikeslike/ViPERDSP.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/viper4linux"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/viper4linux"
    git submodule init -- third_party/ViPERDSP
    git config 'submodule.third_party/ViPERDSP.url' "$srcdir/ViPERDSP"
    git -c protocol.file.allow=always submodule update --init --checkout -- third_party/ViPERDSP
    test "$(git -C third_party/ViPERDSP rev-parse HEAD)" = "$(git rev-parse HEAD:third_party/ViPERDSP)" || return 1
    mkdir -p "$srcdir/ViPERDSP-patched"
    git -C third_party/ViPERDSP archive HEAD | tar -x -C "$srcdir/ViPERDSP-patched"
    VIPERDSP_SOURCE_DIR="$srcdir/ViPERDSP-patched" python3 patches/fix_lufs_speed.py
    VIPERDSP_SOURCE_DIR="$srcdir/ViPERDSP-patched" python3 patches/preallocate_stereo_imager.py
    VIPERDSP_SOURCE_DIR="$srcdir/ViPERDSP-patched" python3 patches/preallocate_multiband_compressor.py
}

build() {
    cmake -S "$srcdir/viper4linux" -B "$srcdir/viper4linux-build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DVIPERDSP_SOURCE_DIR="$srcdir/ViPERDSP-patched"
    cmake --build "$srcdir/viper4linux-build" --parallel "$(nproc)"
}

check() {
    cd "$srcdir/viper4linux"
    bash tests/check-mock.sh
    python3 tests/check-launcher.py
    python3 tests/check-theme-contract.py
    python3 tests/check-ui-contract.py
    python3 tests/check-tray-contract.py
    python3 tests/check-named-presets-contract.py
    python3 tests/check-preset-reset-contract.py
    python3 tests/check-packaging-contract.py
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" | grep -Eq ' [TW] ladspa_descriptor$'
}


package() {
    local tree="$srcdir/viper4linux"
    local built="$srcdir/viper4linux-build"

    bash "$tree/packaging/arch/install-package.sh" \
        "$tree" "$built" "$pkgdir" "$pkgname"
}

