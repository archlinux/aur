# Maintainer: Davide Dalera <davide at dalera dot it>

pkgname=nyora-desktop-appimage
pkgver=3.1.12
pkgrel=1
pkgdesc='A free, independent, open-source manga reader'
url='https://nyora.xyz/'
license=('Apache-2.0')
arch=('x86_64')
source=(
	"https://github.com/Nyora-Manga/nyora-desktop/releases/download/v${pkgver}/Nyora-${pkgver}-linux-x64.AppImage"
	'nyora-desktop.sh'
)
sha256sums=('19ce0d0eb976794ec2b1605dbd28f5ee4df3a48a8d18693b518941bbbf7ab847'
            'af6fbcec6e5f8f5c60bebd160f52b02ed8d6ad93918524db8483e88fd221cbd5')
options=(!strip !debug)
_image="$(basename "${source[0]}")"
_pkgbasename="nyora-desktop"

prepare() {
	cd "${srcdir}"
	chmod +x "${_image}"
	./"${_image}" --appimage-extract
	cp "squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgbasename}.png" ./icon.png
	sed 's/^Exec=.*/Exec=${_pkgbasename} %U/' "squashfs-root/${_pkgbasename}.desktop" >./${_pkgbasename}.desktop
}

package() {
	install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/appimages/${_pkgbasename}.AppImage"
	install -Dm755 "${srcdir}/${_pkgbasename}.sh" "${pkgdir}/usr/bin/${_pkgbasename}"
	install -dm755 "${pkgdir}/usr/share/"
	install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbasename}.png"
	install -Dm644 "${srcdir}/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}
