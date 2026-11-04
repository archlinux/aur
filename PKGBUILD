# Maintainer: YageGeng <icoderdev@outlook.com>

pkgname=dsh-tauri-desktop-bin
# 跟随上游稳定版升级，打包发行号从 1 重新开始。
pkgver=0.30.3
pkgrel=1
pkgdesc='Native desktop application for DeepSeek Harness (official binary)'
arch=('x86_64')
url='https://github.com/dsh-tauri/deepseek-harness-desktop'
# 上游的附加条款限制商业二次开发，不能仅标注为 MIT。
license=('LicenseRef-MIT-with-additional-terms')
depends=(
  # 0.30.0 内置 Electron，补齐其 ELF 直接依赖，避免仅宿主程序能够启动。
  'alsa-lib'
  'at-spi2-core'
  'expat'
  'libcups'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ca-certificates'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  # 上游新增视频桌宠播放，需与官方 deb 一致的 GStreamer 插件。
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'libx11'
  'libxtst'
  'openssl'
  'wayland'
  'webkit2gtk-4.1'
  'xdg-utils'
)
optdepends=(
  'git: Git integration and workspace operations'
  'xdg-desktop-portal: Native directory selection (requires a desktop-specific backend)'
)
# 0.30.0 改用 Electron，但保留原包身份；独立旧版仍因命令路径冲突而互斥。
provides=("dsh-tauri-desktop=${pkgver}")
conflicts=('dsh-tauri-desktop' 'deepseek-harness-desktop')
# 保留上游二进制，避免再次剥离符号或生成无用的调试包。
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dsh-tauri/deepseek-harness-desktop/v${pkgver}/LICENSE"
  "${pkgname}-${pkgver}-LICENSE.details::https://raw.githubusercontent.com/dsh-tauri/deepseek-harness-desktop/v${pkgver}/LICENSE.details"
)
sha256sums=(
  'a9a6b4fb724c6a42f68cc377969ee2816035367ab127aceba7f6af9da3656e5d'
  '3d1e8bb97f9047b71888b14c063b12ed1ee3d5980f122f02c1f150dab6e5f8d0'
)
source_x86_64=("${url}/releases/download/v${pkgver}/Deepseek.Harness.Desktop_${pkgver}_amd64.deb")
# 使用当前 GitHub 发布资产公布的 SHA-256 校验预编译包。
sha256sums_x86_64=('6023e0721f0931766921475e5adaca0865dfbe534611b9f36d92ddd40c7c39ba')

# 安装官方 deb 的完整资源树，补全协议入口并收录上游许可。
package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # 上游入口更名为 DSH Tauri，但仍需补上 URL 占位符以传递 dsh:// 链接。
  sed -i \
    -e 's/^Exec=deepseek-harness-desktop$/Exec=deepseek-harness-desktop %u/' \
    -e 's|^MimeType=x-scheme-handler/dsh$|MimeType=x-scheme-handler/dsh;|' \
    "${pkgdir}/usr/share/applications/DSH Tauri.desktop"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE.details" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.details"
}
