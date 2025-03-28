# Maintainer: Logan Fron <loganfron@gmail.com>

_pkgname=fflogs-uploader
pkgname=${_pkgname}-appimage
pkgver=8.16.25
pkgrel=2
pkgdesc="FFLogs Uploader appimage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-fflogs/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
_appimage="fflogs-v${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}releases/download/v${pkgver}/fflogs-v${pkgver}.AppImage"
		"${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('81945f5df89cf5977ec304e78c752f55eedcb221a7c4bbe86311fe47f21ca8ad'
                   '017d359d64f8190f10e0242bf525acae4cb99c18e9f0500d0b33710779b3f1ae')

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
    mv "${pkgdir}/usr/share/icons/hicolor/512x512" "${pkgdir}/usr/share/icons/hicolor/256x256"

    # symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
