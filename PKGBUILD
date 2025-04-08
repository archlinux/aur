# Maintainer: Cory Sanin <corysanin@outlook.com>

_basename="openrct2"
_pkgname="${_basename}-appimage"
_version="v0.4.21-13-gf4e458e659"
pkgname=${_basename}-appimage
pkgdesc="Develop appimages for OpenRCT2"
pkgver=0.4.21.13
pkgrel=1
provides=("${pkgname}")
conflicts=("${pkgname}")
url="https://openrct2.io"
arch=("x86_64")
license=("GPL3")
_appimage="${_basename}-${pkgver}.AppImage"
source=("${_appimage}"::"https://github.com/OpenRCT2/OpenRCT2-binaries/releases/download/${_version}/OpenRCT2-${_version}-linux-x86_64.AppImage")
sha256sums=('bdda351e34e74884691a280f298e824986de9950a5273613212382c6e143ccb0')
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
