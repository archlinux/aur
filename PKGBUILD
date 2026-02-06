# Maintainer: Aliom <aliom_@outlook.com>
pkgname=dev-janitor-git
_pkgname=dev-janitor
pkgver=r151.3f595f4
pkgrel=1
pkgdesc="Dev Janitor - A developer tool management app (Tauri/Rust Source Build)"
arch=('x86_64')
url="https://github.com/cocojojo5213/Dev-Janitor"
license=('MIT')
# 依赖列表保持不变
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libappindicator-gtk3')
makedepends=('git' 'pnpm' 'python' 'rust' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "Dev-Janitor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "Dev-Janitor"
    # 如果 cargo 下载依赖慢，请取消下面注释并配置镜像
    # export RUSTUP_DIST_SERVER=https://rsproxy.cn
    # export RUSTUP_UPDATE_ROOT=https://rsproxy.cn/rustup
}

build() {
    cd "Dev-Janitor"
    echo "正在安装前端依赖..."
    pnpm install

    echo "正在编译 Rust 后端 + 前端..."
    # 关键修改 1：添加 --bundles none
    # 这告诉 Tauri：只编译二进制文件，不要尝试制作 deb/rpm/appimage
    # 这样就能避开那个 linuxdeploy 的报错
    pnpm tauri build --no-bundle
}

package() {
    cd "Dev-Janitor"

    # 关键修改 2：修正二进制文件名
    # 日志显示生成的文件名是 dev-janitor-v2
    # 我们把它安装到系统里重命名为 dev-janitor
    install -Dm755 "src-tauri/target/release/dev-janitor-v2" "$pkgdir/usr/bin/dev-janitor"

    # 安装图标 (尝试寻找图标路径，如果没有就算了)
    # Tauri v2 图标路径通常在 src-tauri/icons/
    if [ -f "src-tauri/icons/128x128.png" ]; then
        install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/dev-janitor.png"
    elif [ -f "src-tauri/icons/icon.png" ]; then
        install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/dev-janitor.png"
    fi

    # 创建 Desktop 文件
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/dev-janitor.desktop" <<EOF
[Desktop Entry]
Name=Dev Janitor
Exec=/usr/bin/dev-janitor
Icon=dev-janitor
Type=Application
Categories=Development;
Comment=Dev Janitor (Tauri Build)
EOF
}
