# Maintainer: Cory Sanin <corysanin@outlook.com>

_basename="openrct2"
_pkgname="${_basename}-appimage"
_version="v0.4.25-234-gfff4d44b12"
pkgname=${_basename}-appimage
pkgdesc="Develop appimages for OpenRCT2"
pkgver=0.4.25.234
pkgrel=1
provides=("${pkgname}")
conflicts=("${pkgname}")
url="https://openrct2.io"
arch=("x86_64")
license=("GPL3")
_appimage="${_basename}-${pkgver}.AppImage"
source=("${_appimage}"::"https://github.com/OpenRCT2/OpenRCT2-binaries/releases/download/${_version}/OpenRCT2-${_version}-linux-x86_64.AppImage")
sha256sums=('870a84b4d8471173569b0bc1d9b4728f9d8753abb0c518edd6f0e7f787e4cd7f')
options=(!strip)

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "./${_appimage}" --appimage-extract

    # Append appimage to appimage in desktop file
    sed -i -E "s:openrct2:openrct2-appimage:" "${srcdir}/squashfs-root/${_basename}.desktop"
    sed -i -E "s:OpenRCT2:OpenRCT2 AppImage:" "${srcdir}/squashfs-root/${_basename}.desktop"

    # Update icon filenames
    for f in ${srcdir}/squashfs-root/usr/share/icons/hicolor/*/apps/*.*; do mv "${f}" "$(echo "${f}" | sed s:/openrct2\\.:/openrct2-appimage.:)"; done
}

package() {
	# Appimage and symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_basename}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
