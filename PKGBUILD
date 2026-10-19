# Maintainer: duanluan <duanluan@outlook.com>

pkgname=ccgui-bin
_pkgname=ccgui
_appname=ccgui
pkgver=1.1.5
pkgrel=1
pkgdesc='Multi-engine AI coding desktop client (prebuilt binary)'
arch=('x86_64')
url='https://github.com/zhukunpenglinyutong/desktop-cc-gui'
license=('NOASSERTION')
depends=('gtk3' 'webkit2gtk-4.1' 'gst-plugins-base-libs' 'gst-plugins-good')
provides=('ccgui')
conflicts=('ccgui')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/zhukunpenglinyutong/desktop-cc-gui/releases/download/v${pkgver}/CC.GUI_${pkgver}_amd64.AppImage"
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  '137fadc0d589d7105b003da3a62edf5bc44c7cc35a0f916aef95100b079d7de6'
)

package() {
  local appimage="${srcdir}/${_appname}_${pkgver}_amd64.AppImage"
  local extract_dir="${srcdir}/appimage-extract"

  chmod +x "${appimage}"
  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"

  (
    cd "${extract_dir}"
    APPIMAGE_EXTRACT_AND_RUN=1 "${appimage}" --appimage-extract >/dev/null
  )

  install -Dm755 "${extract_dir}/squashfs-root/usr/bin/ccgui-next" \
    "${pkgdir}/opt/${_pkgname}/usr/bin/ccgui-next"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ccgui" <<SCRIPT
#!/bin/sh
export GDK_BACKEND="\${GDK_BACKEND:-x11}"
exec /opt/${_pkgname}/usr/bin/ccgui-next "\$@"
SCRIPT

  ln -s ccgui "${pkgdir}/usr/bin/ccgui-next"
  ln -s ccgui "${pkgdir}/usr/bin/cc-gui"

  local icon_src icon_size
  for icon_src in "${extract_dir}/squashfs-root/usr/share/icons/hicolor/"*"/apps/ccgui-next.png"; do
    [[ -e "${icon_src}" ]] || continue
    icon_size="${icon_src#*squashfs-root/usr/share/icons/hicolor/}"
    icon_size="${icon_size%/apps/ccgui-next.png}"
    install -Dm644 "${icon_src}" "${pkgdir}/usr/share/icons/hicolor/${icon_size}/apps/${_appname}.png"
  done

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ccgui.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=CC GUI
Comment=Multi-engine AI coding desktop client
Exec=ccgui %U
Icon=ccgui
Terminal=false
StartupNotify=true
StartupWMClass=ccgui-next
Categories=Development;IDE;
Keywords=AI;Claude Code;Codex;Gemini;OpenCode;DeepSeek;ccgui;
X-AppImage-Version=${pkgver}
DESKTOP
}
