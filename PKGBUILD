# Maintainer: Alex Kubica <alexkubicail@gmail.com>
# Contributor: Sébastien Feugère <smonff@riseup.net>
# Contributor: Dario Klingenberg <dario.klingenberg at web.de>
pkgname=gopanda
pkgver=2.6.8
pkgrel=1
pkgdesc="Client for the Pandanet-IGS go Server" 
arch=('x86_64')
url="http://pandanet-igs.com/communities/gopanda2"
license=('custom')
depends=()
options=(!strip)
source_x86_64=("https://pandanet-igs.com/gopanda2/download/GoPanda2.AppImage")
md5sums_x86_64=('21620c0be7bb21402181ce1e4a7d448c')
_DEST="/opt/${pkgname}"
_CLIENT="GoPanda2.AppImage"
_NAME="GoPanda2"
_DESKTOP="/usr/share/applications/${_CLIENT}.desktop"
_ICON="/usr/share/pixmaps/${_NAME}.png"

prepare() {
    chmod u+x "${srcdir}/${_CLIENT}"
    ./${_CLIENT} --appimage-extract 2> /dev/null
}

package() {

	# Copy license
	install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "$srcdir/"

	# Program
  	install -Dm755 "${_CLIENT}" "${pkgdir}${_DEST}/${_CLIENT}"
	
	# Link to program
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_DEST}/${_CLIENT}" "${pkgdir}/usr/bin/${pkgname}"

	# Icon
	install -Dm644 "${srcdir}/squashfs-root/${pkgname}2.png" "${pkgdir}${_ICON}"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${pkgname}2.desktop" "${pkgdir}${_DESKTOP}"
	echo "Exec=${_DEST}/${_CLIENT}" >> "${pkgdir}${_DESKTOP}"
	echo "Icon=${_ICON}" >> "${pkgdir}${_DESKTOP}"
	echo "MimeType=application/x-go-sgf;application/x-go-ugf;application/x-go-ugi;" >> "${pkgdir}${_DESKTOP}"
        rm -r "${srcdir}/squashfs-root"
}
