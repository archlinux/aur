# Maintainer: duanluan <duanluan@outlook.com>

pkgname=ccgui-bin
_pkgname=ccgui
_appname=ccgui
pkgver=0.9.4
pkgrel=1
pkgdesc='Next-generation VibeCoding editor (prebuilt binary)'
arch=('x86_64')
url='https://github.com/zhukunpenglinyutong/desktop-cc-gui'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'gst-plugins-base-libs' 'gst-plugins-good')
provides=('ccgui')
conflicts=('ccgui')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/zhukunpenglinyutong/desktop-cc-gui/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.AppImage"
  'LICENSE'
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  'fef0e2d41eab28fea9074d1be9cc4d18178236fb6b3a4cec3e97403b3cd54ab4'
  '7ee7adbd9c6ba3df8397de73285eeac6d21f9692482c0dc92d5c3f11884dae49'
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

  install -Dm755 "${extract_dir}/squashfs-root/usr/bin/cc-gui" \
    "${pkgdir}/opt/${_pkgname}/usr/bin/cc-gui"
  install -Dm755 "${extract_dir}/squashfs-root/usr/bin/cc_gui_daemon" \
    "${pkgdir}/opt/${_pkgname}/usr/bin/cc_gui_daemon"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ccgui" <<SCRIPT
#!/bin/sh
export GDK_BACKEND="\${GDK_BACKEND:-x11}"
exec /opt/${_pkgname}/usr/bin/cc-gui "\$@"
SCRIPT

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ccgui "${pkgdir}/usr/bin/cc-gui"

  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/32x32/apps/cc-gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ccgui.png"
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/cc-gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ccgui.png"
  install -Dm644 "${extract_dir}/squashfs-root/ccgui.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ccgui.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ccgui.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=ccgui
Comment=Next-generation VibeCoding editor
Exec=ccgui %U
Icon=ccgui
Terminal=false
StartupNotify=true
StartupWMClass=cc-gui
Categories=Development;IDE;
Keywords=AI;Claude Code;Codex;Gemini;Opencode;ccgui;
X-AppImage-Version=${pkgver}
DESKTOP
}
