# Maintainer: YageGeng <icoderdev@outlook.com>

pkgname=dsh-tauri-desktop-bin
pkgver=0.22.4
# 修正首次 AUR 发布的替代关系，让已安装的本地版本也能收到更新。
pkgrel=2
pkgdesc='Native desktop application for DeepSeek Harness (official binary)'
arch=('x86_64')
url='https://github.com/dsh-tauri/deepseek-harness-desktop'
# 上游的附加条款限制商业二次开发，不能仅标注为 MIT。
license=('LicenseRef-MIT-with-additional-terms')
depends=(
  'ca-certificates'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
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
# Electron 版是不同应用，仅声明与 Tauri 源码包等价；两者命令路径仍有冲突。
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
sha256sums_x86_64=('dfd33fbfd9a27651f959395a83122aa9856dd6d88561789614cdc4ad4ba030c4')

# 安装官方 deb 的完整资源树，补全协议入口并收录上游许可。
package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # 上游 Exec 缺少 URL 占位符，补上后才能把 dsh:// 链接传给程序。
  sed -i \
    -e 's/^Exec=deepseek-harness-desktop$/Exec=deepseek-harness-desktop %u/' \
    -e 's|^MimeType=x-scheme-handler/dsh$|MimeType=x-scheme-handler/dsh;|' \
    "${pkgdir}/usr/share/applications/Deepseek Harness Desktop.desktop"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE.details" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.details"
}
