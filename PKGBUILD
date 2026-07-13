# Maintainer: yan5xu <liuxiaopeng731@gmail.com>
# Contributor: Burgess LEO

pkgname=ququ-bin
_pkgname=ququ
pkgver=1.0.0
pkgrel=1
pkgdesc="开源免费的 Wispr Flow 替代方案 - 为中文而生的桌面端语音输入工具"
arch=(x86_64)
options=(!strip)
url="https://github.com/lxp731/ququ"
license=('Apache-2.0')
depends=(
  python
  fuse2
)
optdepends=(
  'python-funasr: 本地语音识别引擎 (FunASR)'
  'python-torch: FunASR 所需的深度学习框架'
  'python-torchaudio: 音频处理库'
  'python-librosa: 音频分析库'
  'python-numpy: 科学计算库'
  'python-modelscope: ModelScope 模型管理'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=(
  "${_pkgname}-${pkgver}.AppImage::https://github.com/lxp731/ququ/releases/download/v${pkgver}/QuQu-${pkgver}.AppImage"
  "${_pkgname}.png::https://raw.githubusercontent.com/lxp731/ququ/main/assets/icon.png"
)

sha256sums=('3dacd759191bc1dd8e8190fa7268963676552cd7ee5aa9ced88a69832eb634ee'
            '490bb03b4a2a8255ebf6bcbdb3368dc911689d8e387ba705d11bd2421db066d3')        
package() {
  install -d "${pkgdir}/opt/${_pkgname}"

  # 安装 AppImage
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  # 启动脚本
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'LAUNCHER'
#!/bin/sh
exec /opt/ququ/ququ.AppImage "$@"
LAUNCHER
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  # 图标
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "${srcdir}/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # desktop 文件
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

  # LICENSE
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" << 'LICENSE'
This package downloads and installs the prebuilt AppImage
from https://github.com/lxp731/ququ/releases

See the project repository for the full license text (Apache License 2.0).
LICENSE
}
