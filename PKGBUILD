# Maintainer: username227 {gfrank227 [at] gmail [dot] com}
pkgname=viper4linux-re-git
pkgver=1.0.0.r16.g32befa1
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

# Executables
    install -Dm755 "$built/viper-gui" "$pkgdir/usr/bin/viper4linux-gui"
    install -Dm755 "$built/viper-ctl" "$pkgdir/usr/bin/viper4linux-ctl"
	ln -s -- viper4linux-ctl "$pkgdir/usr/bin/v4l-cli"

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
    ln -s -- viper4linux-ctl.1 "$pkgdir/usr/share/man/man1/v4l-cli.1"

# License and Third-Party Notices
    install -Dm644 "$tree/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$tree/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/ViPERDSP-NOTICE.md"

# Documentation
    install -Dm644 "$tree/README.md" "$pkgdir/usr/share/doc/viper4linux/README.md"
    install -d "$pkgdir/usr/share/doc/viper4linux/docs"
    cp -a "$tree/docs/." "$pkgdir/usr/share/doc/viper4linux/docs/"
}
