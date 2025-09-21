# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gopher64-git
pkgver=1.1.6.r6.gfc41e26a
pkgrel=1
pkgdesc='A Nintendo64 emulator (git version)'
arch=('x86_64')
url='https://github.com/gopher64/gopher64/'
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'vulkan-icd-loader'
    'wayland')
makedepends=(
    'alsa-lib'
    'cargo'
    'clang'
    'cmake'
    'dbus'
    'fcitx'
    'git'
    'hidapi'
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
    'libxi'
    'libxinerama'
    'libxkbcommon'
    'libxrandr'
    'libxrender'
    'libxss'
    'libxtst'
    'lld'
    'llvm'
    'mesa'
    'sndio'
    'systemd-libs'
    'vulkan-headers'
    'wayland-protocols')
provides=('gopher64')
conflicts=('gopher64')
source=('git+https://github.com/gopher64/gopher64.git'
        'git+https://github.com/gopher64/parallel-rdp-standalone.git'
        'gopher64.desktop')
sha256sums=('SKIP'
            'SKIP'
            '9a3c01d2064095b83261bf931aad101bddc94ae66d621e7233f7337d44a01f10')

prepare() {
    git -C gopher64 submodule init
    git -C gopher64 config --local submodule.parallel-rdp/parallel-rdp-standalone.url "${srcdir}/parallel-rdp-standalone"
    git -C gopher64 -c protocol.file.allow='always' submodule update
    
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path='gopher64/Cargo.toml'
}

pkgver() {
    git -C gopher64 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CC='clang'
    export CXX='clang++'
    export AR='llvm-ar'
    export RANLIB='llvm-ranlib'
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTFLAGS+=' -Clink-arg=-fuse-ld=lld'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo build --release --frozen --all-features --manifest-path='gopher64/Cargo.toml'
}

check() {
    export CC='clang'
    export CXX='clang++'
    export AR='llvm-ar'
    export RANLIB='llvm-ranlib'
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTFLAGS+=' -Clink-arg=-fuse-ld=lld'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo test --frozen --all-features --manifest-path='gopher64/Cargo.toml'
}

package() {
    find target/release -maxdepth 1 -type f -executable -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 gopher64.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 gopher64/data/icon/gopher64_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gopher64.png"
    install -D -m644 gopher64/data/icon/gopher64_256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gopher64.png"
    install -D -m644 gopher64/data/icon/gopher64_512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gopher64.png"
}
