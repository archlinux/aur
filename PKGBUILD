# Maintainer: envolution
# Contributor: SoleSoul
# shellcheck shell=bash disable=SC2034,SC2154

_appname=lm-studio
pkgname=lmstudio
pkgver=0.3.16.8
pkgrel=2
pkgdesc="Discover, download, and run local LLMs"
arch=('x86_64')
url="https://lmstudio.ai/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clblast')
makedepends=('squashfs-tools' 'graphicsmagick')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://installers.lmstudio.ai/linux/x64/${pkgver%.*}-${pkgver##*.}/LM-Studio-${pkgver%.*}-${pkgver##*.}-x64.AppImage")
sha256sums=('be8b83cda4a091837ef852b3d2d2e7f48b47834b509a7164d94ed1950c805168')
noextract=("${_appimage}")

prepare() {
  rm -rf squashfs-root
  chmod +x "${_appimage}"

  # get the files we need for packaging
  offset=$(./"${_appimage}" --appimage-offset)
  unsquashfs -o "$offset" -d squashfs-root "${_appimage}" \
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
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"

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
