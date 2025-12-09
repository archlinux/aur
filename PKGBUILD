# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer : Sergey Kostrukov <sergey at kostrukov dot com>
# Contributor : Tianrui Wei <archlinux_aur at mail dot tianrui-wei dot com>
# Contributor : Marcio Silva <marcionps at gmail dot com>

_pkgname=todoist

pkgname="${_pkgname}"-appimage
pkgver=9.25.1
pkgrel=1
pkgdesc="The to-do list to organize work & life."
arch=('x86_64')
url="https://todoist.com/"
license=('custom:Commercial')
depends=('zlib' 'fuse2' 'appimagelauncher')
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://electron-dl.todoist.net/linux/Todoist-linux-${pkgver}-x86_64-latest.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('c3cae4db70b1185b40790585bbefd6215419cc73409b28cd09da893cb02765d3')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|" \
    "squashfs-root/${_pkgname}.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/todoist.png" "${pkgdir}/usr/share/pixmaps"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
