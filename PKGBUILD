# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Rain Clark <rain AT melonbread DOT dev>
# Based on: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

pkgname=imgbrd-grabber-appimage
_pkgname="${pkgname%-appimage}"
_reponame=imgbrd-grabber
_rdnsname=org.bionus.Grabber
pkgver=7.14.0
pkgrel=1
pkgdesc='Very customizable imageboard/booru downloader with powerful filenaming features'
arch=(x86_64)
url="https://github.com/Bionus/${_reponame}"
license=('Apache-2.0')
depends=(
  hicolor-icon-theme
  zlib
  fuse
  glibc
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_appimage="Grabber_v${pkgver}-${arch}.AppImage"
noextract=("${_appimage}")
options=(!strip !debug)
source=(
  "https://github.com/Bionus/${_reponame}/releases/download/v${pkgver}/${_appimage}"
  "https://raw.githubusercontent.com/Bionus/${_reponame}/v${pkgver}/LICENSE"
)
sha256sums=('d283f33769e76141c8984ea6bc68970af58fed56b3b48e9666fabfa30af99d09'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract

  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    "squashfs-root/${_rdnsname}.desktop"

  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # Desktop file
  install -Dm644 "squashfs-root/${_rdnsname}.desktop" "${pkgdir}/usr/share/applications/${_rdnsname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
