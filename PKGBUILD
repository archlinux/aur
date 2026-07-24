# Maintainer: yan5xu <liuxiaopeng731@gmail.com>
# Contributor: Burgess LEO

pkgname=ququ-bin
_pkgname=ququ
pkgver=1.1.9
pkgrel=1
pkgdesc="开源免费的 Wispr Flow 替代方案 - 为中文而生的桌面端语音输入工具"
arch=(x86_64)
options=(!strip)
url="https://github.com/lxp731/ququ"
license=('Apache-2.0')
depends=(
  gtk3
  nss
  alsa-lib
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  mesa
  pango
  cairo
  libdrm
  hicolor-icon-theme
)
optdepends=(
  'libappindicator-gtk3: 系统托盘图标支持'
  'podman: 运行 FunASR 后端容器（推荐）'
  'docker: 运行 FunASR 后端容器（替代方案）'
  'ydotool: 键盘模拟，用于自动粘贴（推荐）'
  'wtype: Wayland 原生键盘模拟，自动粘贴备选'
  'xdotool: X11 键盘模拟，自动粘贴备选'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=(
  "${_pkgname}-${pkgver}.deb::https://github.com/lxp731/ququ/releases/download/v${pkgver}/ququ-v${pkgver}.deb"
)

sha256sums=('0e3d4c20e457ef5c6fe06055ddb731f3db8a48d91a3fefda66f5278fdc3ba3ed')

package() {
  cd "${srcdir}"

  # 确保 locale 为 UTF-8，否则 tar/bsdtar 无法处理中文路径
  export LANG=C.UTF-8

  # 从 deb 包中解压数据
  ar x "${_pkgname}-${pkgver}.deb"
  tar -xf data.tar.xz -C "${pkgdir}"

  # 启动脚本（/usr/bin/ququ -> /opt/蛐蛐/ququ）
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'LAUNCHER'
#!/bin/sh
exec /opt/蛐蛐/ququ "$@"
LAUNCHER
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  # 覆盖 desktop 文件，使用 /usr/bin/ququ 作为入口
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << 'DESKTOP'
[Desktop Entry]
Name=蛐蛐
Name[en]=QuQu
Comment=开源免费的 Wispr Flow 替代方案，为中文而生的语音输入工具
Comment[en]=Open-source Wispr Flow alternative, Chinese-optimized voice input tool
Exec=/usr/bin/ququ
Icon=ququ
Type=Application
Categories=Office;Utility;
Keywords=voice;speech;dictation;ASR;Chinese;
Terminal=false
StartupWMClass=ququ
DESKTOP

  # 将图标移到标准尺寸目录（deb 中放在 0x0 下不标准）
  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"

  # LICENSE
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" << 'LICENSE'
This package downloads and installs the prebuilt deb package
from https://github.com/lxp731/ququ/releases

See the project repository for the full license text (Apache License 2.0).
LICENSE
}
