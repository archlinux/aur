# Maintainer: dest4590 <dest4590@collapseloader.org>
pkgname=collapseloader-git
pkgver=r556.0346b46
pkgrel=1
pkgdesc="GUI utility for launching Minecraft clients, built with Rust and Tauri (git version)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'zstd')
makedepends=('rust' 'cargo' 'npm' 'git' 'base-devel' 'pkgconf')
provides=('collapseloader')
conflicts=('collapseloader-bin')
source=("git+https://github.com/dest4590/CollapseLoader.git")
sha256sums=('SKIP')

pkgver() {
    cd "CollapseLoader"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "CollapseLoader"
    
    # Установка зависимостей npm
    npm install
}

build() {
    cd "CollapseLoader"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    
    # Собираем только бинарник без бандлов
    cargo build --release --manifest-path=src-tauri/Cargo.toml
}

package() {
    cd "CollapseLoader"
    
    # Определяем имя бинарника
    local binary_name="collapseloader"
    
    # Проверяем разные возможные пути к бинарнику
    if [ -f "src-tauri/target/release/${binary_name}" ]; then
        install -Dm755 "src-tauri/target/release/${binary_name}" \
            "${pkgdir}/usr/bin/${binary_name}"
    elif [ -f "target/release/${binary_name}" ]; then
        install -Dm755 "target/release/${binary_name}" \
            "${pkgdir}/usr/bin/${binary_name}"
    else
        echo "Error: Binary not found!"
        return 1
    fi
    
    # Установка .desktop файла
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${binary_name}.desktop" <<EOF
[Desktop Entry]
Version=0.2.3
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients
Exec=${binary_name}
Icon=${binary_name}
Terminal=false
Categories=Game;Utility;
Keywords=minecraft;launcher;
EOF
    
    # Установка иконок
    for size in 32 64 128 256; do
        if [ -f "src-tauri/icons/${size}x${size}.png" ]; then
            install -Dm644 "src-tauri/icons/${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${binary_name}.png"
        fi
    done
    
    # Установка главной иконки
    if [ -f "src-tauri/icons/icon.png" ]; then
        install -Dm644 "src-tauri/icons/icon.png" \
            "${pkgdir}/usr/share/pixmaps/${binary_name}.png"
    fi
    
    # Установка лицензии
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
