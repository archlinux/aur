# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gopher64
pkgver=1.0.16
pkgrel=2
pkgdesc='A Nintendo64 emulator'
arch=('x86_64')
url='https://github.com/gopher64/gopher64/'
license=('GPL-3.0-only')
depends=(
    'bzip2'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'vulkan-icd-loader'
    'xz')
makedepends=(
    'alsa-lib'
    'cargo'
    'clang'
    'cmake'
    'dbus'
    'git'
    'hidapi'
    'icoutils'
    'jack'
    'libdecor'
    'libdrm'
    'libgl'
    'libgles'
    'libibus'
    'libpipewire'
    'libpulse'
    'libunwind'
    'liburing'
    'libusb'
    'libx11'
    'libxcursor'
    'libxext'
    'libxfixes'
    'libxinerama'
    'libxkbcommon'
    'libxrandr'
    'libxrender'
    'libxss'
    'mesa'
    'sndio'
    'systemd-libs'
    'vulkan-headers'
    'wayland'
    'wayland-protocols')
source=("git+https://github.com/gopher64/gopher64.git#tag=v${pkgver}"
        'git+https://github.com/Themaister/parallel-rdp-standalone.git')
sha256sums=('1cca26ffb769ce28c3522b4bd960b42b75c5e99b90ad13726a8d4d103e5ae0bd'
            'SKIP')

prepare() {
    git -C gopher64 submodule init
    git -C gopher64 config --local submodule.parallel-rdp/parallel-rdp-standalone.url "${srcdir}/parallel-rdp-standalone"
    git -C gopher64 -c protocol.file.allow='always' submodule update
    
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path='gopher64/Cargo.toml'
    icotool -x gopher64/data/icon.ico -o gopher64/data
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='gopher64/target'
    cargo build --release --frozen --manifest-path='gopher64/Cargo.toml'
}

check() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='gopher64/target'
    cargo test --frozen --manifest-path='gopher64/Cargo.toml'
}

package() {
    find gopher64/target/release -maxdepth 1 -type f -executable -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    
    local _icon
    local _res
    while read -r -d '' _icon
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_icon")"
        install -D -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/gopher64.png"
    done < <(find gopher64/data -maxdepth 1 -type f -name 'icon_*_*x*x*.png' -print0)
    
    install -D -m644 gopher64/data/gopher64.png -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -D -m644 gopher64/data/gopher64.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
