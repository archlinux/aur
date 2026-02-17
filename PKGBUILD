# Maintainer:
# Contributor:
pkgname=sealantern
pkgver=0.6.0
pkgrel=1
pkgdesc="一个轻量化的 Minecraft 服务器管理工具 ，基于 Tauri 2 + Rust + Vue 3"
arch=('x86_64')
url="https://github.com/FPSZ/SeaLantern"
license=('GPL-3.0-or-later')
depends=(
    # GTK 相关基础依赖
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'pango'
    'atk'
    'libgl'
    
    # WebKit 相关依赖
    'webkit2gtk'                    # 包含 javascriptcoregtk [citation:1]
    'libsoup'
    
    # 系统图标主题
    'hicolor-icon-theme'
    'adwaita-icon-theme'
    
    # 桌面文件相关
    'desktop-file-utils'
    'shared-mime-info'
    
    # 安全相关
    'libxss'                        # X11 Screen Saver extension library [citation:2]
    'nss'
    'nspr'
    
    # 系统托盘支持
    'libayatana-appindicator'
    'libappindicator-gtk3'
    
    # 网络相关
    'curl'
    'wget'
    'openssl'
    'ca-certificates'
    'gnutls'
    
    # 图形相关
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxrandr'
    'libxrender'
    'libxtst'
    'libxss'                         # 对应 libxscrnsaver [citation:2]
    
    # 字体支持
    'fontconfig'
    'freetype2'
    
    # 音频支持
    'alsa-lib'
    'libpulse'                       # pulseaudio 的客户端库 [citation:3]
    
    # 数据库支持
    'sqlite3'
    
    # 压缩支持
    'zlib'
    'bzip2'
    'xz'
    
    # 其他常用库
    'expat'
    'libffi'
    'pcre'
    'pcre2'
    'libgcrypt'
    'libgpg-error'
    'libdatrie'
    'libthai'
    'libice'
    'libsm'
    'util-linux'                     # 包含 libuuid [citation:6]
    'util-linux-libs'                 # 包含 libuuid 的库文件 [citation:6]
)

# 编译时需要的依赖
makedepends=(
    'dpkg'
    'binutils'
    'file'
    'findutils'
    'grep'
    'sed'
    'gawk'
)

# 可选依赖（推荐但不是必须的）
optdepends=(
    'ffmpeg: 视频/音频编解码支持'
    'gst-plugins-base: GStreamer 基础插件'
    'gst-plugins-good: GStreamer 优质插件'
    'gst-plugins-bad: GStreamer 额外插件'
    'gst-plugins-ugly: GStreamer 非自由插件'
    'noto-fonts: 更好的字体显示'
    'noto-fonts-cjk: 中日韩字体支持'
    'noto-fonts-emoji: 表情符号支持'
)

options=('!strip' '!emptydirs')
install=${pkgname}.install

source=("https://github.com/FPSZ/SeaLantern/releases/download/sea-lantern-v$pkgver/Sea.Lantern_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    echo "正在提取 Sea.Lantern_${pkgver}_amd64.deb ..."

    # 使用 dpkg-deb 提取
    dpkg-deb -x "Sea.Lantern_${pkgver}_amd64.deb" "${pkgdir}"

    # 确保二进制文件在正确的位置
    if [[ -f "${pkgdir}/usr/local/bin/sealantern" ]]; then
        install -dm755 "${pkgdir}/usr/bin"
        mv "${pkgdir}/usr/local/bin/sealantern" "${pkgdir}/usr/bin/"
        rmdir "${pkgdir}/usr/local/bin" 2>/dev/null || true
        rmdir "${pkgdir}/usr/local" 2>/dev/null || true
    fi

    # 检查是否有 desktop 文件，如果没有则使用我们提供的
    if [[ ! -f "${pkgdir}/usr/share/applications/sealantern.desktop" ]]; then
        if [[ -f "${srcdir}/sealantern.desktop" ]]; then
            install -Dm644 "${srcdir}/sealantern.desktop" \
                "${pkgdir}/usr/share/applications/sealantern.desktop"
        fi
    fi

    # 检查是否有图标，如果没有则尝试从 AppImage 提取
    if [[ ! -d "${pkgdir}/usr/share/icons/hicolor" ]] || \
       [[ -z "$(find "${pkgdir}/usr/share/icons/hicolor" -name "*.png" 2>/dev/null)" ]]; then
        echo "警告：未找到图标文件，可能需要手动添加"
    fi

    # 确保图标缓存更新钩子能工作
    if [[ -d "${pkgdir}/usr/share/icons" ]]; then
        find "${pkgdir}/usr/share/icons" -name "icon-theme.cache" -delete
    fi

    echo ""
    echo "========================================="
    echo "安装完成！"
    echo "========================================="
    echo "已安装的文件："
    find "${pkgdir}" -type f -name "sealantern*" -o -name "*.desktop" | head -20
    echo ""
    echo "依赖统计: ${#depends[@]} 个运行时依赖"
    echo "========================================="
}