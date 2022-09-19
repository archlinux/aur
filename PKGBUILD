# Maintainer: Logan Fron <loganfron@gmail.com>

_pkgname=fflogs-uploader
pkgname=${_pkgname}-appimage
pkgver=5.9.5
pkgrel=1
pkgdesc="FFLogs Uploader appimage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-fflogs/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="ff-logs-uploader-${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}releases/download/v${pkgver}/FF-Logs-Uploader-${pkgver}.AppImage"
		"${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('ea1943f7b2acd017f259f0f1723e352603c41ed7f623e773c785b3b02e5dc468'
                   'ec7fb5abd0c5aa8f63645d73f04901bac8e46fdaacf1eeaec16d8bd5b2040398')

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

    # symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
