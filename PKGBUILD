maintainer=dest4590@collapseloader.org
pkgname=collapseloader-git
pkgver=latest
pkgrel=1
pkgdesc="GUI utility for launching Minecraft clients, built with Rust and Tauri (git version)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'npm' 'nodejs' 'git' 'clang' 'base-devel')
provides=('collapseloader')
conflicts=('collapseloader')
source=("git+https://github.com/dest4590/CollapseLoader.git")
sha256sums=('SKIP')

pkgver() {
    cd "CollapseLoader"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "CollapseLoader"
    
    cargo install tauri-cli --locked
    
    npm install
}

build() {
    cd "CollapseLoader"
    
    export RUSTC_WRAPPER=""
    
    cargo tauri build 2>&1 | tee build.log || {
        if [ -f "src-tauri/target/release/collapseloader" ]; then
            echo "Binary built successfully, ignoring bundling errors"
            return 0
        else
            echo "Failed to build binary"
            return 1
        fi
    }
}

package() {
    cd "CollapseLoader"
    
    install -Dm755 "src-tauri/target/release/collapseloader" "${pkgdir}/usr/bin/collapseloader"
    
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
    
    for size in 32 64 128 256; do
        if [ -f "src-tauri/icons/${size}x${size}.png" ]; then
            install -Dm644 "src-tauri/icons/${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/collapseloader.png"
        fi
    done
    
    if [ -f "src-tauri/icons/icon.png" ]; then
        install -Dm644 "src-tauri/icons/icon.png" \
            "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi
    
    # Install license if exists
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
