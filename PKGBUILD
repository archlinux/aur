# Maintainer: envolution
# Contributor: SoleSoul
# shellcheck shell=bash disable=SC2034,SC2154

_appname=lm-studio
pkgname=lmstudio
pkgver=0.3.16.7
pkgrel=1
pkgdesc="Discover, download, and run local LLMs"
arch=('x86_64')
url="https://lmstudio.ai/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clblast')
makedepends=('graphicsmagick')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://installers.lmstudio.ai/linux/x64/${pkgver%.*}-${pkgver##*.}/LM-Studio-${pkgver%.*}-${pkgver##*.}-x64.AppImage")
conflicts=(lmstudio-appimage)
noextract=("${_appimage}")
sha256sums_x86_64=('19a63702c689425711511b0d253279259dba465416eb747188cc4717142881ab')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_appname}|" \
    "squashfs-root/${_appname}.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/opt/${pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" \
    "${pkgdir}/usr/share/applications/${_appname}.desktop"

  #source icon from squashfs
  src_icon="$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png"
  sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256")

  # Loop through each size and create resized icons
  for size in "${sizes[@]}"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/$size/apps"
    gm convert "$src_icon" -resize "$size" "$pkgdir/usr/share/icons/hicolor/$size/apps/lm-studio.png"
  done

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_appname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
