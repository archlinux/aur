# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mossx-bin
_pkgname=mossx
_appname=ccgui
pkgver=0.5.2
pkgrel=2
pkgdesc='MossX desktop client for Claude Code, Codex, Gemini, and Opencode (prebuilt binary)'
arch=('x86_64')
url='https://www.mossx.ai/download'
license=('MIT')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1')
provides=('mossx' 'ccgui')
conflicts=('mossx' 'ccgui')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/zhukunpenglinyutong/desktop-cc-gui/releases/download/v0.5.2/ccgui_0.5.2_amd64.AppImage"
  'LICENSE'
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  'ccb921965fc8a256ad8cb670fbf58fb99d9e9a4cd7a09898828d261ce157f508'
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

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mossx" <<SCRIPT
#!/bin/sh
exec env APPIMAGE_EXTRACT_AND_RUN=1 APPIMAGELAUNCHER_DISABLE=1 \\
  /opt/${_pkgname}/${_appname}_${pkgver}_amd64.AppImage "\$@"
SCRIPT

  install -dm755 "${pkgdir}/usr/bin"
  ln -s mossx "${pkgdir}/usr/bin/ccgui"
  ln -s mossx "${pkgdir}/usr/bin/cc-gui"

  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/32x32/apps/cc-gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mossx.png"
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/cc-gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mossx.png"
  install -Dm644 "${extract_dir}/squashfs-root/ccgui.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mossx.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mossx.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=MossX
Comment=Next-generation VibeCoding desktop client
Exec=mossx %U
Icon=mossx
Terminal=false
StartupNotify=true
StartupWMClass=cc-gui
Categories=Development;IDE;
Keywords=AI;Claude Code;Codex;Gemini;Opencode;MossX;
X-AppImage-Version=0.5.2
DESKTOP
}
