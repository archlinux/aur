# Maintainer: envolution
# Contributor: SoleSoul
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=lmstudio-beta
_appname=lm-studio
pkgver=0.3.31.5
_pkgver="${pkgver%.*}-${pkgver##*.}"
pkgrel=1
pkgdesc="Discover, download, and run local LLMs"
arch=('x86_64')
url="https://lmstudio.ai/"
license=('LicenseRef-EULA')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clblast')
makedepends=('squashfs-tools' 'graphicsmagick')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://installers.lmstudio.ai/linux/x64/${_pkgver}/LM-Studio-${_pkgver}-x64.AppImage")
sha256sums=('859939086b548548d2b6dadcc9a1c83b57b2e2b971702fe2594c9dc64f4a5ef9')
noextract=("${_appimage}")

prepare() {
  rm -rf squashfs-root
  chmod +x "${_appimage}"

  # get the files we need for packaging
  unset PAGER # unsquashfs is very picky about pager settings
  offset=$(./"${_appimage}" --appimage-offset)
  unsquashfs -q -o "$offset" -d squashfs-root "${_appimage}" \
    "${_appname}.desktop" \
    "usr/share/icons/hicolor/0x0/apps/lm-studio.png" \
    "LICENSE.electron.txt" \
    "LICENSES.chromium.html"
  # unsquashfs -o "$offset" -l "${_appimage}" | grep -i license
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|" \
    "squashfs-root/${_appname}.desktop"
  sed -i -E "s|Icon=.*|Icon=${pkgname}|" \
    "squashfs-root/${_appname}.desktop"
  sed -i -E "s|Name=.*|Name=LM Studio Beta|" \
    "squashfs-root/${_appname}.desktop"
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/EULA" <<< "https://lmstudio.ai/app-terms"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  #source icon from squashfs
  src_icon="$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png"
  sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256")

  # Loop through each size and create resized icons
  for size in "${sizes[@]}"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/$size/apps"
    gm convert "$src_icon" -resize "$size" "$pkgdir/usr/share/icons/hicolor/$size/apps/${pkgname}.png"
  done

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ts=2 sw=2 et:
