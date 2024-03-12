# Maintainer: Logan Fron <loganfron@gmail.com>

_pkgname=fflogs-uploader
pkgname=${_pkgname}-appimage
pkgver=8.3.16
pkgrel=1
pkgdesc="FFLogs Uploader appimage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-fflogs/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="fflogs-v${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}releases/download/v${pkgver}/fflogs-v${pkgver}.AppImage"
		"${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('8ec05e809d03b8aed438a4aaa608f4c251cb7dc937f8f21eb7c1ca229061d006'
                   'b746ff09a3cdac8c284b2352fee78d05292e7c303a6a47cb9afe773af2c7af9d')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
	}

build() {
	# fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # install .desktop and append version
    install -Dm644 "${srcdir}/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/256x256"

    # symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
