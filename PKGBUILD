# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gopher64
pkgver=1.1.24
pkgrel=2
pkgdesc='A Nintendo64 emulator'
arch=('x86_64')
url='https://github.com/gopher64/gopher64/'
license=('GPL-3.0-only')
depends=(
    'fontconfig'
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'vulkan-icd-loader'
    'wayland')
makedepends=(
    'alsa-lib'
    'cargo'
    'clang'
    'cmake'
    'dbus'
    'fcitx5'
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
source=("git+https://github.com/gopher64/gopher64.git#tag=v${pkgver}"
        'git+https://github.com/Themaister/parallel-rdp-standalone.git'
        'git+https://github.com/RetroAchievements/rcheevos.git'
        'gopher64.desktop')
sha256sums=('f8dc10c88deb68cb7d7fda470c76a69a1288f87560439ea4cb5657ba8c8807b2'
            'SKIP'
            'SKIP'
            '9a3c01d2064095b83261bf931aad101bddc94ae66d621e7233f7337d44a01f10')

prepare() {
    git -C gopher64 submodule init
    git -C gopher64 config --local submodule.parallel-rdp/parallel-rdp-standalone.url "${srcdir}/parallel-rdp-standalone"
    git -C gopher64 config --local submodule.src/compat/sse2neon.update none
    git -C gopher64 config --local submodule.retroachievements/rcheevos.url "${srcdir}/rcheevos"
    git -C gopher64 -c protocol.file.allow='always' submodule update
    
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path='gopher64/Cargo.toml'
}

build() {
    export CC='clang'
    export CXX='clang++'
    export AR='llvm-ar'
    export RANLIB='llvm-ranlib'
    export CFLAGS+=' -ffat-lto-objects'
    export CMAKE_POLICY_VERSION_MINIMUM='3.5'
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
    export CMAKE_POLICY_VERSION_MINIMUM='3.5'
    export RUSTFLAGS+=' -Clink-arg=-fuse-ld=lld'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo test --frozen --all-features --manifest-path='gopher64/Cargo.toml'
}

package() {
    find target/release -maxdepth 1 -type f -executable -not -name '*.so*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 gopher64.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 gopher64/data/icon/gopher64_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gopher64.png"
    install -D -m644 gopher64/data/icon/gopher64_256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gopher64.png"
    install -D -m644 gopher64/data/icon/gopher64_512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gopher64.png"
    install -d -m755 "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' target/release/*.so* "${pkgdir}/usr/lib"
    chmod 644 "${pkgdir}/usr/lib"/*.so*
}
