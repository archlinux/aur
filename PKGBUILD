# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=hyprdm-full-git
pkgver=1.0
pkgrel=1
pkgdesc="Hyprland Display Manager HyprDM full version"
arch=('x86_64')
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

    echo ">>> FFI library building...."
    export HDM_API_LIB_TYPE=c
    cargo build --workspace --features c_ffi

    echo ">>> Greeter building... (hyprdmgreeterd)..."
    cd greeterd
    make
}

package() {
    cd "$srcdir/hyprdm/gui-api"

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
        install -Dm755 "configmanager/target/release/hyprdmconfigmanager" "$pkgdir/usr/bin/hyprdmconfigmanager"
    fi

    if [ -d "../quickshell" ]; then
        mkdir -p "$pkgdir$HOME/.config/quickshell"
        cp -r quickshell/* "$pkgdir$HOME/.config/quickshell/"
    fi
}
