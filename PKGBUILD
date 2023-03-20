# Maintainer: Alex Kubica <alexkubicail@gmail.com>
# Contributor: Sébastien Feugère <smonff@riseup.net>
# Contributor: Dario Klingenberg <dario.klingenberg at web.de>
pkgname=gopanda
pkgver=2.8.1
pkgrel=1
pkgdesc="Client for the Pandanet-IGS go Server" 
arch=('x86_64')
url="http://pandanet-igs.com/communities/gopanda2"
license=('custom')
depends=()
options=(!strip)
source_x86_64=("https://pandanet-igs.com/gopanda2/download/GoPanda2.AppImage")
md5sums_x86_64=('0e9318ea2905420e37a2466579b79388')
_DEST="/opt/${pkgname}"
_CLIENT="GoPanda2.AppImage"
_NAME="GoPanda2"
_DESKTOP="/usr/share/applications/${_CLIENT}.desktop"
_ICON="/usr/share/pixmaps/${_NAME}.png"

prepare() {
    chmod u+x "${srcdir}/${_CLIENT}"
    ./${_CLIENT} --appimage-extract 2> /dev/null
}

check() {
    MATCH=$(cat ${srcdir}/squashfs-root/gopanda2.desktop | grep X-AppImage-Version=$pkgver || [[ $? == 1 ]])
    if [[ -z ${MATCH} ]]; then
        echo "Version check failed! A newer version has been released, but the
        PKGBUILD has not yet been updated. Change the pkgver and checksums in
        the PKGUILB yourself and/or leave a comment at
        https://aur.archlinux.org/packages/gopanda/ so that the PKGBUILD will be
        updated.";
        exit 1;
    fi
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
