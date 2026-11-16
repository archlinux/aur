# Maintainer: cmach_socket <solaris@cmach.top>

pkgname=bigbluefish-bin
_pkgname=bigbluefish
pkgver=1.1.3
pkgrel=1
pkgdesc="蓝色大肥鱼 —— 基于 Avalonia + 内置 llama.cpp 的本地大模型 AI 桌宠"
arch=('x86_64')
url='https://github.com/Bai-Cute/big-blue-fish-desktop-pet'
license=('Apache-2.0')
options=('strip' 'debug')

# ---------------------------------------------------------------------------
# 上游没有提供 Arch 官方包，本包直接把上游的 Debian .deb 重打包为 Arch 包。
#
# 目录布局沿用上游 .deb（保持不变，避免行为差异）：
#   /opt/bigbluefish/            Avalonia + 自包含 .NET 10 运行时 + 动画素材
#   /opt/bigbluefish/runtime/    随包内置的 llama.cpp / ggml 推理运行时
#   /usr/bin/bigbluefish         启动脚本（exec /opt/bigbluefish/BigBlueFish.Linux）
#   /usr/share/applications/     .desktop 入口
#   /usr/share/icons/hicolor/    256x256 应用图标
#
# 程序本身不含硬编码的 /opt 路径（内部一律用 AppContext.BaseDirectory 推导
# runtime/ 等相对目录），因此布局是可搬迁的；这里仍然保持上游布局，是为了让
# .desktop / 启动脚本 / 用户已有的调用方式与上游 Debian 安装完全一致。
# namcap 会报 "ELF file outside of a valid path"，这是有意为之。
#
# ---------------------------------------------------------------------------
# 上游已知的 Linux 启动崩溃缺陷及本包的修复：
#
#   Avalonia 12.1.4 + SkiaSharp 在 Linux 上获取"默认字体族名"时，会走到
#   fontconfig 的空 family 查询；该查询返回的是 .ttc 集合字体（Noto Sans CJK
#   / 用户自装的 微软雅黑 .ttc 等），Skia 读不出 family 名，于是默认 typeface
#   的族名为空字符串。Avalonia 随后回退到 SystemFonts[0] 仍失败，最终抛出：
#
#     System.InvalidOperationException: Could not create glyphTypeface.
#     Font family: $Default (key: ). Style: Normal. Weight: Normal.
#     Stretch: Normal
#
#   崩溃点在窗口初始化（LinuxPetWindow.MoveBubble），应用直接退出。
#   上游 .deb 内没有 /etc/fonts 配置，说明 Debian 包同样存在该缺陷。
#
#   修复方式：随包提供一份应用专用的 fontconfig 配置，在系统配置基础上把
#   DejaVu Sans（.ttf，Skia 能正确读出族名）弱前置（weak prepend），使 Skia
#   能取到非空默认族名。该配置只作用于本应用（通过启动脚本设置
#   FONTCONFIG_FILE），不会污染全局 /etc/fonts/conf.d。
# ---------------------------------------------------------------------------

depends=(
    # --- 基础 C/C++ 运行时 ---
    'glibc'                # libc.so.6
    'gcc-libs'             # libstdc++.so.6 / libgcc_s.so.1 / libgomp.so.1
    'zlib'                 # libz.so.1
    'zstd'                 # libzstd.so.1（llama.cpp 权重解压）
    'brotli'               # libbrotli{common,dec,enc}.so.1
    'bzip2'                # libbz2.so.1.0
    'expat'                # libexpat.so.1（fontconfig 依赖链）
    'openssl'              # libcrypto.so.3 / libssl.so.3（llama-server）
    'icu'                  # .NET globalization（libicuuc.so）

    # --- 图形 / 字体 ---
    'fontconfig'           # libfontconfig.so.1（SkiaSharp）
    'freetype2'            # libfreetype.so.6
    'libpng'               # libpng16.so.16
    'ttf-dejavu'           # DejaVu Sans（.ttf）—— 启动必需，见下方说明

    # --- X11 / 窗口系统（Avalonia X11 后端）---
    'libx11'
    'libxcomposite'
    'libxext'
    'libxss'
    'libxi'
    'libxcursor'
    'libxrandr'
    'libxrender'
    'libice'
    'libsm'

    # --- 桌面集成 ---
    'dbus'                 # libdbus-1.so.3（StatusNotifier / portal）
    'vulkan-icd-loader'    # libvulkan.so.1（ggml Vulkan 后端）

    # --- 音视频 / OCR ---
    'gstreamer'            # gstreamer1.0 核心
    'gst-plugins-base'     # gstreamer1.0-plugins-base
    'gst-plugins-good'
    'gst-plugins-bad'
    'ffmpeg'               # 录屏 / 视频解码
    'tesseract'            # /usr/bin/tesseract，Linux 端 OCR
    'tesseract-data-chi_sim'
    'tesseract-data-eng'
    'noto-fonts-cjk'       # 中文字形

    # --- 辅助工具 ---
    'xdg-utils'            # /usr/bin/xdg-open
    'polkit'               # /usr/bin/pkexec
)

optdepends=(
    'xdg-desktop-portal: 截图 / 文件门户（Wayland 下必需）'
    'xdg-desktop-portal-gtk: GTK 门户后端'
    'gst-plugin-va: VA-API 硬件加速解码'
    # libcoreclrtraceptprovider.so 硬链接 liblttng-ust.so.0（仅 .NET EventPipe
    # 跟踪用到，不装也不影响运行）。Arch 现行 lttng-ust 只提供 .so.1，
    # 需要 .so.0 得装 lttng-ust2.12，而它与 lttng-ust 冲突，故列为可选依赖。
    'lttng-ust2.12: .NET EventPipe 跟踪支持（liblttng-ust.so.0）'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "BigBlueFish-v${pkgver}-Linux-x64.deb::https://github.com/Bai-Cute/big-blue-fish-desktop-pet/releases/download/v${pkgver}/BigBlueFish-v${pkgver}-Linux-x64.deb"
    'LICENSE::https://raw.githubusercontent.com/Bai-Cute/big-blue-fish-desktop-pet/main/LICENSE'
)
sha512sums=('a3c928d9948b720103c22ccd4bcd0d9e3daf28bfc51e950d8d5fa87b1528092968485836b1af4e6315b8d71ec799a7e40c06f657086d81cbd28ebe4c1f27914f'
            '9f45bf7412637524eded718313d3b1cf5c838de9fdc3633ecbacb82e5fd8f095864bc93ff2868a37a21de38b053c101d8e2a59176a0ec3b449645b239e134ec0')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/BigBlueFish-v${pkgver}-Linux-x64.deb"

    bsdtar -xf data.tar.xz -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"

    # 上游 Apache-2.0 许可正文（.deb 内未附带，随包的第三方许可说明位于
    # /opt/bigbluefish/licenses/）。
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # --- 应用专用的 fontconfig 配置（修复上游默认字体族名为空导致的启动崩溃）---
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    cat > "${pkgdir}/usr/share/${_pkgname}/fonts.conf" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <!-- 系统字体配置（/etc/fonts/fonts.conf 内部已包含 /etc/fonts/conf.d）-->
  <include ignore_missing="yes">/etc/fonts/fonts.conf</include>
  <!-- 用户级字体配置 ~/.config/fontconfig/fonts.conf -->
  <include prefix="xdg" ignore_missing="yes">fontconfig/fonts.conf</include>

  <!-- 弱前置 DejaVu Sans：Skia 只能从 .ttf 正确读出族名（.ttc 集合字体
       读不出），弱绑定不影响其他字体的族名，仅改变默认字体的选取顺序，
       从而让 Avalonia 能取到非空的默认字体族名，避免启动即崩溃。-->
  <match target="font">
    <edit name="family" mode="prepend" binding="weak">
      <string>DejaVu Sans</string>
    </edit>
  </match>
</fontconfig>
EOF
    chmod 644 "${pkgdir}/usr/share/${_pkgname}/fonts.conf"

    # --- 启动脚本：指向应用专用的 FONTCONFIG_FILE ---
    cat > "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
# 蓝色大肥鱼启动脚本（重打包自上游 Debian 包）
#
# 上游 Avalonia/Skia 在 Linux 上取不到默认字体族名时，会在窗口初始化阶段崩溃：
#   System.InvalidOperationException: Could not create glyphTypeface.
#   Font family: $Default (key: ). Style: Normal. Weight: Normal. Stretch: Normal
# 这里使用本包自带的 fontconfig 配置（弱前置 DejaVu Sans）来规避。
# 用户已自行设置 FONTCONFIG_FILE 时，尊重用户设置。

if [ -z "${FONTCONFIG_FILE}" ]; then
    FONTCONFIG_FILE="/usr/share/bigbluefish/fonts.conf"
    export FONTCONFIG_FILE
fi

exec /opt/bigbluefish/BigBlueFish.Linux "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
