# Maintainer: envolution

_appname=lm-studio
pkgname=lmstudio
pkgver=0.3.5.2
pkgrel=1
pkgdesc="Discover, download, and run local LLMs"
arch=('x86_64')
url="https://lmstudio.ai/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clblast')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://releases.lmstudio.ai/linux/x86/${pkgver%.*}/${pkgver##*.}/LM_Studio-${pkgver%.*}.AppImage")
conflicts=(lmstusio-appimage)
noextract=("${_appimage}")
sha256sums_x86_64=('ca5512e96ac66af356d566eba019c22de78c05e057e35a27b7029e40bba0ebfb')

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
  install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" \
    "${pkgdir}/usr/share/applications/${_appname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_appname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
