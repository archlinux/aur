# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=hyprdm-full-git
pkgver=1.0
pkgrel=1
pkgdesc="Hyprland Display Manager HyprDM full version"
arch=('x86_64')
conflicts=('hyprdm-rob')
url="https://github.com/hyprcommunity/hyprdm"
license=('BSD3')
depends=(
    'hyprland'
    'wayland'
    'pam'
    'gtk3'
    'qt5-base'
    'qt5-declarative'
    'qt5-wayland'
    'qt5-graphicaleffects'
    'libxkbcommon'
)

makedepends=(
    'git'
    'rust'
    'cargo'
    'pkgconf'
    'cmake'
    'make'
    'vulkan-headers'
)
provides=('hyprdm')
conflicts=('hyprdm')

source=("git+https://github.com/hyprcommunity/hyprdm.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hyprdm"
    git describe --tags --abbrev=0 | sed 's/^v//; s/-/./g'
}

build() {
    cd "$srcdir/hyprdm/gui-api"

    # 1. C/FFI modu ile HDM_API ve wlrootbackends derleme
    echo ">>> Building FFI libraries (hdm_api + wlrootbackends)..."
    export HDM_API_LIB_TYPE=c
    cargo build --release --workspace --features c_ffi

    # 2. Rust modu ile HDM_API derleme
    echo ">>> Building hdm_api in Rust mode..."
    export HDM_API_LIB_TYPE=rust
    cargo build --release

    # 3. Greeter derleme
    echo ">>> Building Greeter (hyprdmgreeterd)..."
    cd greeterd
    make
}

package() {
    cd "$srcdir/hyprdm/gui-api"

    # Rust modu libhdm_api kopyalama
    if [ -f "target/release/libhdm_api.so" ]; then
        install -Dm755 "target/release/libhdm_api.so" "$pkgdir/usr/lib/libhdm_api.so"
    fi
    if [ -f "target/release/libhdm_api.a" ]; then
        install -Dm644 "target/release/libhdm_api.a" "$pkgdir/usr/lib/libhdm_api.a"
    fi

    # FFI kütüphanesi -> libhyprdmbackend.so.1
    if [ -f "target/release/libhyprdmbackend.so" ]; then
        install -Dm755 "target/release/libhyprdmbackend.so" "$pkgdir/usr/lib/libhyprdmbackend.so.1"
    fi

    # Greeter -> hyprdmgreeterd
    if [ -f "greeterd/hyprdmgreeterd" ]; then
        install -Dm755 "greeterd/hyprdmgreeterd" "$pkgdir/usr/bin/hyprdmgreeterd"
    fi

    # Config Manager -> hyprdmconfigmanager
    if [ -f "../configmanager/target/release/hyprdmconfigmanager" ]; then
        install -Dm755 "../configmanager/target/release/hyprdmconfigmanager" "$pkgdir/usr/bin/hyprdmconfigmanager"
    fi

    # Quickshell config
    if [ -d "../quickshell" ]; then
        mkdir -p "$pkgdir$HOME/.config/quickshell"
        cp -r quickshell/* "$pkgdir$HOME/.config/quickshell/"
    fi
}
