# Maintainer: Neolux Lee

# D-Robotics (Horizon Robotics) xburn 芯片烧录 GUI。
#
# 上游只发布 Ubuntu/Debian 的预编译二进制。主程序 xburn-gui 是一个 Tauri(Rust)
# 应用，其 Linux 后端硬链接到 libwebkit2gtk-4.0.so.37（WebKitGTK 的 4.0 API）。
# 而 Arch Linux 官方仓库已经移除了以下这些旧版 soname：
#   - libwebkit2gtk-4.0.so.37 / libjavascriptcoregtk-4.0.so.18 (WebKitGTK 4.0)
#   - libsoup-2.4.so.1        (libsoup 2.x 已移除，仅剩 libsoup3)
#   - libicu*.so.70           (ICU 70，Arch 现为 76)
# 因此本 PKGBUILD 从 Ubuntu 22.04 额外下载这 4 个包并“私有打包”，放到
# /usr/lib/xburn-gui/lib/，通过启动脚本设置 LD_LIBRARY_PATH 加载，不污染系统。

pkgname=xburn-gui
pkgver=1.2.1
pkgrel=1
pkgdesc="D-Robotics (Horizon) xburn chip burner GUI"
arch=('x86_64')
url="https://archive.d-robotics.cc/"
license=('custom:proprietary')
options=('!debug')  # 预编译二进制，无调试符号，跳过 -debug 子包
depends=(
    # GTK 基础栈（主程序 + 私有 webkit 都需要）
    'gtk3' 'glib2' 'pango' 'cairo' 'gdk-pixbuf2' 'at-spi2-core'
    # WebKit 运行时（私有 webkit 在运行时依赖这些 Arch 包提供的库）
    'libxml2-legacy'  # libxml2.so.2（Arch 新版 libxml2 已改为 .so.16，旧 soname 由此包提供）
    'libepoxy' 'libwebp' 'libjpeg-turbo' 'libpng'
    'freetype2' 'fontconfig' 'expat' 'harfbuzz' 'harfbuzz-icu' 'woff2'
    'lcms2' 'libxslt' 'sqlite' 'libgcrypt' 'libtasn1' 'hyphen'
    'libmanette' 'enchant' 'libsecret' 'libseccomp' 'libx11' 'wayland'
    'mesa' 'libdrm' 'gstreamer' 'gst-plugins-base-libs'
    # 私有 libsoup-2.4 的依赖
    'libpsl' 'brotli' 'krb5'
    # 系统 / 其它
    'systemd-libs'   # libudev.so.1, libsystemd.so.0
    'libusb'         # tools/linux/dfu-util 需要 libusb-1.0.so.0
)
makedepends=('libarchive')  # bsdtar 用于解包 .deb
optdepends=(
    'polkit: .desktop 启动器使用 pkexec 提权运行（命令行直接运行则不需要）'
)
source=(
    "xburn-gui_${pkgver}_amd64.deb::https://archive.d-robotics.cc/downloads/software_tools/download_tools/xburn-gui_${pkgver}/xburn-gui_${pkgver}_amd64.deb"
    'libwebkit2gtk-4.0-37.deb::https://security.ubuntu.com/ubuntu/pool/main/w/webkit2gtk/libwebkit2gtk-4.0-37_2.50.4-0ubuntu0.22.04.1_amd64.deb'
    'libjavascriptcoregtk-4.0-18.deb::https://security.ubuntu.com/ubuntu/pool/main/w/webkit2gtk/libjavascriptcoregtk-4.0-18_2.50.4-0ubuntu0.22.04.1_amd64.deb'
    'libicu70.deb::https://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu70_70.1-2_amd64.deb'
    'libsoup2.4-1.deb::https://archive.ubuntu.com/ubuntu/pool/main/libs/libsoup2.4/libsoup2.4-1_2.74.2-3ubuntu0.7_amd64.deb'
)
sha256sums=(
    '34524f8c15d438d1262962d7aead621ef9f4a0dea3557d4c7cd92c4a5696d3d6'
    '121a795af0b4851eaa13b4e0cd55ba6261d7cf1578801bf39ce7c295af7d1174'
    '68aafd3f6d0a560276875e6275713dc5f55e8cda570f9e33d38d94ba4906ce5e'
    '58a154f6307289813da2276f900498ef536ae7c0522d2cf31a3c3c5cf62dfd9a'
    'e51a22c0558dc96f399c768ceeb65bee08d75912936d9de8ed3cd5858cab7f31'
)

# 解包 .deb（自动识别 data.tar.gz / data.tar.zst 压缩方式）
_extract_deb() {
    local deb="$1" dest="$2" member
    member=$(bsdtar -tf "$deb" | grep -m1 -E '^data\.tar\.')
    install -dm755 "$dest"
    bsdtar -xf "$deb" -O "$member" | bsdtar -xf - -C "$dest"
}

prepare() {
    _extract_deb "xburn-gui_${pkgver}_amd64.deb"  "$srcdir/xburn"
    _extract_deb 'libwebkit2gtk-4.0-37.deb'        "$srcdir/rt-webkit"
    _extract_deb 'libjavascriptcoregtk-4.0-18.deb' "$srcdir/rt-jsc"
    _extract_deb 'libicu70.deb'                    "$srcdir/rt-icu"
    _extract_deb 'libsoup2.4-1.deb'                "$srcdir/rt-soup"
}

package() {
    # 1) 安装应用目录树（保留上游 /usr 布局：/usr/bin/xburn、
    #    /usr/lib/xburn-gui/{configs,tools}、/usr/share/...）
    cp -a "$srcdir/xburn/usr" "$pkgdir/"

    # 2) 私有打包运行库（WebKitGTK 4.0 + ICU 70 + libsoup 2.4，来自 Ubuntu 22.04）
    local libdir="$pkgdir/usr/lib/xburn-gui/lib"
    install -dm755 "$libdir"
    cp -a "$srcdir/rt-webkit/usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37"*     "$libdir/"
    cp -a "$srcdir/rt-jsc/usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.0.so.18"* "$libdir/"
    cp -a "$srcdir/rt-icu/usr/lib/x86_64-linux-gnu/libicudata.so.70"*               "$libdir/"
    cp -a "$srcdir/rt-icu/usr/lib/x86_64-linux-gnu/libicui18n.so.70"*               "$libdir/"
    cp -a "$srcdir/rt-icu/usr/lib/x86_64-linux-gnu/libicuuc.so.70"*                 "$libdir/"
    cp -a "$srcdir/rt-soup/usr/lib/x86_64-linux-gnu/libsoup-2.4.so.1"*              "$libdir/"

    # 3) 将真正的 xburn-gui 移入 /usr/lib/xburn-gui/，并在 /usr/bin/ 放置
    #    一个设置 LD_LIBRARY_PATH 的启动脚本（LD_LIBRARY_PATH 可传递搜索，
    #    能同时找到私有打包的 webkit/jsc/icu/libsoup 及其它依赖）。
    mv "$pkgdir/usr/bin/xburn-gui" "$pkgdir/usr/lib/xburn-gui/xburn-gui"
    cat > "$pkgdir/usr/bin/xburn-gui" <<'EOF'
#!/bin/sh
APPDIR="/usr/lib/xburn-gui"
export LD_LIBRARY_PATH="$APPDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$APPDIR/xburn-gui" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/xburn-gui"

    # 4) WebKit 辅助进程。libwebkit2gtk 会按编译期硬编码的绝对路径 spawn 这些
    #    子进程，因此必须放到 /usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/ 下
    #    （它们会继承启动脚本设置的 LD_LIBRARY_PATH，从而找到私有打包的库）。
    local wkdir="$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0"
    install -dm755 "$wkdir/injected-bundle"
    install -m755 "$srcdir/rt-webkit/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/WebKitNetworkProcess" "$wkdir/"
    install -m755 "$srcdir/rt-webkit/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/WebKitWebProcess"    "$wkdir/"
    install -m755 "$srcdir/rt-webkit/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/WebKitGPUProcess"    "$wkdir/"
    install -m755 "$srcdir/rt-webkit/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so" "$wkdir/injected-bundle/"

    # 5) 将上游自带的 udev 规则安装到系统 udev 目录，使 USB 烧录板可被访问。
    install -Dm644 \
        "$srcdir/xburn/usr/lib/xburn-gui/configs/udev/rules.d/51-drobotics-usb.rules" \
        "$pkgdir/usr/lib/udev/rules.d/51-drobotics-usb.rules"
}
