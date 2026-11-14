# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：Mister Download Manager（GPL-3.0 开源下载管理器），上游 anefzaoui/misterdownloadmanager。
#   上游 Linux release 的 tar.gz 只含可执行文件/浏览器扩展/许可证，**不含** .desktop 与图标，
#   这两项由本 PKGBUILD 提供；图标取自上游 art/，固定 commit 避免随 main 漂移。
#   source 走 gh-proxy.com 加速（大陆直连 GitHub 慢）。
pkgname=misterdownloadmanager-private-bin
_pkgname=misterdownloadmanager
_upstream=anefzaoui/misterdownloadmanager
_distname=MisterDownloadManager
_iconrev=8d68f9bf6dc7a84d16a0b7088d916a7ca16368b7
pkgver=0.5.2
pkgrel=2
pkgdesc='自用维护：多线程/断点续传/浏览器接管/BT 下载管理器，上游 anefzaoui/misterdownloadmanager'
arch=('x86_64')
url="https://github.com/${_upstream}"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'gtk3' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland' 'dbus'
         'ca-certificates' 'hicolor-icon-theme')
optdepends=('vulkan-icd-loader: GPU 加速渲染')
makedepends=('python-pillow')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_distname}-${pkgver}-linux-x86_64.tar.gz::https://gh-proxy.com/https://github.com/${_upstream}/releases/download/v${pkgver}/${_distname}-${pkgver}-linux-x86_64.tar.gz"
        "misterdownloadmanager.png::https://raw.githubusercontent.com/${_upstream}/${_iconrev}/art/Mister%20Download%20Manager.png")
sha256sums=('3327ebd6b5565186c3e1286bbfdc85ffc95fa681cc2a57a51b0bc07ff42a009f'
            '0bd9403acd085b2bbe8c8c2ebcc9f082faba8d0c0a649327164b0ea95d77d425')

package() {
  local _root="${srcdir}/${_distname}-${pkgver}-linux-x86_64"

  install -Dm755 "${_root}/misterdownloadmanager" "${pkgdir}/usr/bin/misterdownloadmanager"
  install -Dm755 "${_root}/misterdownloadmanager-cli" "${pkgdir}/usr/bin/misterdownloadmanager-cli"
  install -Dm755 "${_root}/misterdownloadmanager-mcp" "${pkgdir}/usr/bin/misterdownloadmanager-mcp"
  install -Dm755 "${_root}/misterdownloadmanager-nmhost" "${pkgdir}/usr/bin/misterdownloadmanager-nmhost"

  # 上游 tar.gz 无图标：取上游 art/ 大图按 hicolor 规范缩到 256x256
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  python - "${srcdir}/misterdownloadmanager.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/misterdownloadmanager.png" <<'PY'
import sys
from PIL import Image
Image.open(sys.argv[1]).convert("RGBA").resize((256, 256), Image.LANCZOS).save(sys.argv[2])
PY

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/misterdownloadmanager.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Mister Download Manager
GenericName=Download Manager
Comment=Download manager
Exec=env WINIT_X11_SCALE_FACTOR=1.5 misterdownloadmanager %U
Icon=misterdownloadmanager
Terminal=false
Categories=Network;FileTransfer;
MimeType=x-scheme-handler/magnet;application/x-bittorrent;
StartupWMClass=misterdownloadmanager
DESKTOP

  # 与上游 tar.gz/deb 一致：浏览器扩展与许可证
  install -d "${pkgdir}/usr/share/misterdownloadmanager"
  cp -a "${_root}/extension-chromium" "${pkgdir}/usr/share/misterdownloadmanager/extension-chromium"
  install -Dm644 "${_root}/mdm-firefox.xpi" "${pkgdir}/usr/share/misterdownloadmanager/mdm-firefox.xpi"
  install -Dm644 "${_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_root}/ATTRIBUTION.md" "${pkgdir}/usr/share/doc/${pkgname}/ATTRIBUTION.md"
}
