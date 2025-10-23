# Maintainer: Dario Klingenberg <dario.klingenberg at web.de>
pkgname=weiqihub
pkgver=0.1.10
pkgrel=1
pkgdesc="Nonofficial Client for Various Go Servers and Go Problem Collection (BSD-3 but contains nonfree server protocols)"
arch=('x86_64')
url="https://walruswq.com/WeiqiHub"
license=('BSD-3-Clause')
depends=(fuse2)
options=(!strip)
source_x86_64=("https://github.com/ale64bit/WeiqiHub/releases/download/v$pkgver/WeiqiHub-v$pkgver-$arch.AppImage")
md5sums_x86_64=('2b32b423d98f6540344c26c89aef1c75')
_DEST="/opt/${pkgname}"
_CLIENT="WeiqiHub-v${pkgver}-${arch}.AppImage"
_NAME="WeiqiHub"
_DESKTOP="/usr/share/applications/${_CLIENT}.desktop"
_ICON="/usr/share/pixmaps/${_NAME}.png"

prepare() {
    chmod u+x "${srcdir}/${_CLIENT}"
    ./${_CLIENT} --appimage-extract 2> /dev/null
}

package() {

	cd "$srcdir/"

	# Program
  	install -Dm755 "${_CLIENT}" "${pkgdir}${_DEST}/${_CLIENT}"
	
	# Link to program
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_DEST}/${_CLIENT}" "${pkgdir}/usr/bin/${pkgname}"

	# Icon
	install -Dm644 "${srcdir}/squashfs-root/wqhub.png" "${pkgdir}${_ICON}"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/com.walruswq.wqhub.desktop" "${pkgdir}${_DESKTOP}"
	echo "Exec=${_DEST}/${_CLIENT}" >> "${pkgdir}${_DESKTOP}"
	echo "Icon=${_ICON}" >> "${pkgdir}${_DESKTOP}"
	echo "MimeType=application/x-go-sgf;application/x-go-ugf;application/x-go-ugi;" >> "${pkgdir}${_DESKTOP}"
        rm -r "${srcdir}/squashfs-root"
}
