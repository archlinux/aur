# Maintainer: JohnChiao <johnchiao@outlook.com>
pkgname=touchfish-client
pkgver=0.0.3
pkgrel=1
pkgdesc="TouchFish V5 官方支持的现代化客户端，基于 Flutter 构建"
arch=('x86_64' 'aarch64')
url="https://github.com/JohnChiao75/TouchFish-Client"
license=('AGPL-3.0')
depends=(
    'gtk3'
    'libsecret'
    'jsoncpp'
    'mpv'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-libav'
)
makedepends=(
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
    'patchelf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnChiao75/TouchFish-Client/archive/refs/heads/aur.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/TouchFish-Client-aur"

    # 获取 Flutter 依赖
    flutter pub get

    # 构建 Linux 发布版本
    flutter build linux --release
}

package() {
    cd "$srcdir/TouchFish-Client-aur"

    # 安装主程序到 /usr/lib/touchfish-client
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/$pkgname/"

    # 创建启动脚本
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec /usr/lib/touchfish-client/touchfish_client "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # 安装许可证文件
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # 安装桌面入口文件
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=TouchFish Client
Comment=TouchFish V5 现代化聊天客户端
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
}
