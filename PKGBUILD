# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.0.13
pkgrel=1
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from the IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source=("${_pkgname}-${pkgver}-${CARCH}.AppImage::https://github.com/DetachHead/rebased/releases/download/1.0.13/Rebased-x86_64.AppImage")
sha256sums=('5e588adac72e52c9348777448800fd37938fd74429a8d356824a8a1c5405a29b')

package() {
  local appimage="${srcdir}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
  local extract_dir="${srcdir}/appimage-extract"

  chmod +x "${appimage}"
  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"

  (
    cd "${extract_dir}"
    APPIMAGE_EXTRACT_AND_RUN=1 "${appimage}" --appimage-extract >/dev/null
  )

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "${appimage}" "${pkgdir}/opt/${_pkgname}/Rebased-x86_64.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/rebased" <<'SCRIPT'
#!/bin/sh
exec env APPIMAGE_EXTRACT_AND_RUN=1 APPIMAGELAUNCHER_DISABLE=1 \
  /opt/rebased/Rebased-x86_64.AppImage "$@"
SCRIPT

  install -Dm644 "${extract_dir}/squashfs-root/usr/bin/idea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${extract_dir}/squashfs-root/rebased.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${extract_dir}/squashfs-root/usr/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${extract_dir}/squashfs-root/usr/NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rebased.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Version=1.0
Name=Rebased
Comment=Standalone Git client based on the IntelliJ platform
Exec=rebased %f
Icon=rebased
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-rebased
Categories=Development;IDE;VersionControl;
Keywords=git;vcs;jetbrains;
X-AppImage-Version=1.0.13
DESKTOP
}
