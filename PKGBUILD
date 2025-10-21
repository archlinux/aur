# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=note-gen
_pkgname=note-gen
pkgver=0.22.1
pkgrel=1
pkgdesc="A cross-platform Markdown note-taking application with AI integration"
arch=('x86_64')
url="https://github.com/codexu/note-gen"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pnpm')
provides=('note-gen')
conflicts=('note-gen-bin')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/note-gen-v$pkgver.tar.gz")
sha256sums=('87b8a5af2c8596304890a275bbbba294a01aeb3040ea3dbb3fb12011425ee06b')

prepare() {
    cd "$_pkgname-$pkgver"
    # 设置前端环境
    export npm_config_build_from_source=true
    export CARGO_HOME="$srcdir/.cargo"

    # 安装前端依赖
    pnpm install
}

build() {
    cd "$_pkgname-$pkgver"
    export CARGO_HOME="$srcdir/.cargo"
    export npm_config_build_from_source=true

    # 构建前端
    pnpm build

    # 构建Tauri应用
    cd src-tauri
    cargo build --release
}

package() {
    cd "$_pkgname-$pkgver/src-tauri"
    export CARGO_HOME="$srcdir/.cargo"

    # 安装二进制文件
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # 安装图标
    cd ..
    for size in 32x32 128x128 128x128@2x; do
        if [ -f "icons/$size.png" ]; then
            install -Dm644 "icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size%x*}/apps/$_pkgname.png"
        fi
    done

    # 创建桌面入口
    install -Dm644 "resources/app-icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    cat > "$pkgdir/usr/share/applications/$_pkgname.desktop" << EOF
[Desktop Entry]
Name=NoteGen
Comment=A cross-platform Markdown note-taking application with AI integration
Exec=$_pkgname
Icon=$_pkgname
Type=Application
Categories=Office;Utility;TextEditor;
StartupNotify=true
EOF
}