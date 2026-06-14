# Maintainer: duanluan <duanluan@outlook.com>

pkgname=ccgui-bin
_pkgname=ccgui
_appname=ccgui
pkgver=0.5.8
pkgrel=1
pkgdesc='Next-generation VibeCoding editor (prebuilt binary)'
arch=('x86_64')
url='https://github.com/zhukunpenglinyutong/desktop-cc-gui'
license=('MIT')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1')
provides=('ccgui')
conflicts=('ccgui')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/zhukunpenglinyutong/desktop-cc-gui/releases/download/v0.5.8/ccgui_0.5.8_amd64.AppImage"
  'LICENSE'
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  'a12a7a1da6774a8a287da51bf7b41a1e669b8d46487f3cf8821f9ce527389dc1'
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

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "${appimage}" "${pkgdir}/opt/${_pkgname}/${_appname}_${pkgver}_amd64.AppImage"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ccgui" <<SCRIPT
#!/bin/sh
exec env APPIMAGE_EXTRACT_AND_RUN=1 APPIMAGELAUNCHER_DISABLE=1 \\
  /opt/${_pkgname}/${_appname}_${pkgver}_amd64.AppImage "\$@"
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
X-AppImage-Version=0.5.8
DESKTOP
}
