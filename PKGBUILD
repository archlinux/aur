# Maintainer: hoywu <wu_git [at-symbol] outlook [dot] com>
# Based on: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=longbridge

pkgname="${_pkgname}"-pro-appimage
pkgver=0.9.0
pkgrel=1
pkgdesc="A professional trading platform tailored to your needs"
arch=('x86_64')
url="https://longbridge.com/desktop/"
license=('custom:Longbridge-Platform-TnCs')
conflicts=('longbridge-pro')
depends=('glibc' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
_license="LICENSE.pdf"
source_x86_64=("${_appimage}::https://assets.lbctrl.com/github/release/${_pkgname}-desktop/stable/${_pkgname}-v${pkgver}-linux-x86_64.AppImage"
               "${_license}::https://pub.lbkrs.com/static/offline/202508/FN9DnQt1WuLR5Wmz/LBPL_Platform_TnCs_3_December_2024.pdf")
noextract=("${_appimage}")
sha256sums_x86_64=('bce0ab51970a0cfa1d691d0655d142fe22c4722ae23cff87ed710249fa942825'
                   'c7ed0deafa4570da6fd7d173f8be759645673ee55d3a41ef9473e0d6658ad231')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E \
      -e "s|^Name=.*|Name=Longbridge Pro|" \
      -e "s|^Exec=${_pkgname}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
      "squashfs-root/${_pkgname}.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/${_license}" "${pkgdir}/opt/${pkgname}/${_license}"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/${_license}" "$pkgdir/usr/share/licenses/$pkgname"
}
