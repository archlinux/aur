# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=note-gen
_pkgname=note-gen
pkgver=0.22.1
pkgrel=31
pkgdesc="A cross-platform Markdown note-taking application with AI integration"
arch=('x86_64')
url="https://github.com/codexu/note-gen"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg' 'libvips' 'libxcb' 'libxrandr')
makedepends=('rust' 'nodejs' 'npm' 'pnpm' 'pkgconf' 'clang' 'sqlite')
provides=('note-gen')
conflicts=('note-gen-bin')
options=('!strip' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/note-gen-v$pkgver.tar.gz")
sha256sums=('87b8a5af2c8596304890a275bbbba294a01aeb3040ea3dbb3fb12011425ee06b')

prepare() {
    cd "$pkgname-$pkgname-v$pkgver"
    # 设置构建环境
    export npm_config_build_from_source=true
    export CARGO_HOME="$srcdir/.cargo"

    # 安装前端依赖
    pnpm install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgname-v$pkgver"
    export CARGO_HOME="$srcdir/.cargo"
    export npm_config_build_from_source=true

    # 构建Tauri应用 (包含前端构建，跳过打包)
    pnpm tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgname-v$pkgver/src-tauri"
    export CARGO_HOME="$srcdir/.cargo"

    # 安装二进制文件
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # 安装图标 - 基于实际源码结构
    cd ..

    # 安装存在的图标尺寸 (根据源码实际文件)
    for size in 32x32 64x64 128x128; do
        if [ -f "src-tauri/icons/$size.png" ]; then
            install -Dm644 "src-tauri/icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/$_pkgname.png"
        fi
    done

    # 安装HiDPI图标 (根据源码实际文件)
    if [ -f "src-tauri/icons/128x128@2x.png" ]; then
        install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/128x128@2x/apps/$_pkgname.png"
    fi

    # 创建桌面入口和备用图标 (使用实际存在的文件)
    if [ -f "public/app-icon.png" ]; then
        install -Dm644 "public/app-icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    elif [ -f "src-tauri/icons/128x128.png" ]; then
        install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    fi
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << EOF
[Desktop Entry]
Name=NoteGen
Comment=A cross-platform Markdown note-taking application with AI integration
Exec=$_pkgname
Icon=$_pkgname
Type=Application
Categories=Office;Utility;TextEditor;
StartupNotify=true
EOF

    # 创建清理脚本
    install -Dm644 /dev/stdin "$pkgdir/usr/share/$_pkgname/cleanup.sh" << 'CLEANUP_EOF'
#!/bin/bash
# NoteGen cleanup script for package removal

# Remove user data directory (optional, commented out for safety)
# rm -rf "$HOME/.config/note-gen"
# rm -rf "$HOME/.local/share/note-gen"

# Remove cache directory
if [ -d "$HOME/.cache/note-gen" ]; then
    rm -rf "$HOME/.cache/note-gen"
fi

# Remove desktop database cache
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database -q /usr/share/applications
fi

# Update icon cache
if command -v gtk-update-icon-cache &> /dev/null; then
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
fi
CLEANUP_EOF

    # Make cleanup script executable
    chmod +x "$pkgdir/usr/share/$_pkgname/cleanup.sh"
}

pre_remove() {
    # Stop any running NoteGen processes
    pkill -f "note-gen" 2>/dev/null || true
    sleep 2
    pkill -9 -f "note-gen" 2>/dev/null || true
}

post_remove() {
    # Run cleanup script if it exists
    if [ -f "/usr/share/$_pkgname/cleanup.sh" ]; then
        bash "/usr/share/$_pkgname/cleanup.sh"
    fi

    # Remove the cleanup script itself
    rm -f "/usr/share/$_pkgname/cleanup.sh"
    rmdir "/usr/share/$_pkgname" 2>/dev/null || true

    echo "NoteGen has been removed."
    echo "To remove user data, run:"
    echo "  rm -rf ~/.config/note-gen ~/.local/share/note-gen"
}