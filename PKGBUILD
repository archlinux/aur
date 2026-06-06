# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pilauncher-bin
_pkgname=pilauncher
_appname=PiLauncher
pkgver=0.1.32
pkgrel=1
pkgdesc='Modern gamepad-friendly Minecraft launcher built with Tauri (prebuilt binary)'
arch=('x86_64')
url='https://github.com/MrShellad/pilauncher'
license=('custom')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1')
provides=('pilauncher')
conflicts=('pilauncher')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/MrShellad/pilauncher/releases/download/v0.1.32/PiLauncher_0.1.32_amd64.AppImage"
  'LICENSE'
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  '4f1abd397d322749a266d493a6bd09562fb557c52a137e2ebfbe05ba77080a7d'
  '7157f59f7e954221b7d3d5754c2f963881620ec0490152720493133ea0afb6f8'
)

package() {
  local appimage="${srcdir}/${_appname}_${pkgver}_amd64.AppImage"
  local extract_dir="${srcdir}/appimage-extract"
  local desktop_source
  local icon_source

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

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pilauncher" <<SCRIPT
#!/bin/sh
exec env APPIMAGE_EXTRACT_AND_RUN=1 APPIMAGELAUNCHER_DISABLE=1 \\
  /opt/${_pkgname}/${_appname}_${pkgver}_amd64.AppImage "\$@"
SCRIPT

  desktop_source="$(find "${extract_dir}/squashfs-root" -type f -iname 'pilauncher.desktop' | head -n1)"
  if [[ -n "${desktop_source}" ]]; then
    install -Dm644 "${desktop_source}" "${pkgdir}/usr/share/applications/pilauncher.desktop"
    sed -i \
      -e 's|^Exec=.*|Exec=pilauncher %U|' \
      -e 's|^Icon=.*|Icon=pilauncher|' \
      -e 's|^Categories=.*|Categories=Game;|' \
      "${pkgdir}/usr/share/applications/pilauncher.desktop"
  else
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pilauncher.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=PiLauncher
Comment=Modern gamepad-friendly Minecraft launcher
Exec=pilauncher %U
Icon=pilauncher
Terminal=false
StartupNotify=true
StartupWMClass=PiLauncher
Categories=Game;
Keywords=Minecraft;Launcher;PiLauncher;
X-AppImage-Version=0.1.32
DESKTOP
  fi

  icon_source="$(find "${extract_dir}/squashfs-root" -type f \( -iname 'pilauncher.png' -o -iname 'logo.png' \) | head -n1)"
  if [[ -n "${icon_source}" ]]; then
    install -Dm644 "${icon_source}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pilauncher.png"
  fi
}
