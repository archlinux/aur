# Maintainer: Young Acinonyx <young [dot] acinonyx [at] gmail [dot] com>

pkgname=final-fight-lns-ultimate
_pkgname=fflns
_urlname=Final_Fight_LNS_Ultimate
pkgver=04
_shadersver=5.4.2
pkgrel=1
pkgdesc="A beat'em up game that mixes concepts and movements from beat'em up and fighting games"
arch=('x86_64')
url="https://fflnsultimate.firebaseapp.com/home"
license=('custom')
depends=('glibc')
makedepends=('curl')
options=(!strip)
source=("$(curl -sL "https://www.mediafire.com/file/8bc1j7ivn1iqadh/${_urlname}_V${pkgver}_Linux_x64.tar.gz/file" | grep 'id="downloadButton"' | sed -e 's/.*href="//g' -e 's/".*//g')"
	"$(curl -sL "https://www.mediafire.com/file/axlg17bs5o5ep96/${_urlname}_V${pkgver}_Reshade_${_shadesver}.7z/file" | grep 'id="downloadButton"' | sed -e 's/.*href="//g' -e 's/".*//g')"
	"$(curl -sL "https://www.mediafire.com/file/b3pqfak5lzrjbz8/${_urlname}_V.${pkgver}_-_Pak.7z/file" | grep 'id="downloadButton"' | sed -e 's/.*href="//g' -e 's/".*//g')")
sha256sums=('89a7be5cb30491a1a596df3b62ac70d98a1f46dae63d5bf1edf6afbc44820bdb'
            'f484591f62b9fc1b23632e206e8ab9a48ae4d8d1340d8ace9396e7cc25d712ad'
            'e99b7c54b7a7c552940c33f21ba3eef44968a94a84eb0db57b02551fe049d996')

prepare() {
	rm "${srcdir}/opengl32.dll"
	sed -i "s_Exec='Final Fight LNS Ultimate.AppImage'_Exec=${_pkgname}_g" "${srcdir}/${_pkgname}_linux64/Final Fight LNS Ultimate.desktop"
	sed -i "s_Icon=ico_Icon=/usr/share/pixmaps/${_pkgname}.png_g" "${srcdir}/${_pkgname}_linux64/Final Fight LNS Ultimate.desktop"
}

package() {
	install -dm777 "${pkgdir}/opt/${_pkgname}/Logs"
	install -dm755 "${pkgdir}/opt/${_pkgname}/Paks"
	install -dm777 "${pkgdir}/opt/${_pkgname}/Saves"
	install -dm777 "${pkgdir}/opt/${_pkgname}/ScreenShots"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -dm755 "${pkgdir}/usr/share/applications"

	install -Dm644 "${srcdir}/${_pkgname}_linux64/ico.png" "${pkgdir}/usr/share/pixmaps/fflns.png"
	install -Dm644 "${srcdir}/${_pkgname}_linux64/Final Fight LNS Ultimate.desktop" "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/${_pkgname}_linux64/Final Fight LNS Ultimate.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	echo -e '#!/bin/bash\n\n(cd /opt/fflns/ ; /opt/fflns/fflns)' > "${pkgdir}/usr/bin/${_pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "${srcdir}/Final Fight LNS.pak" "${pkgdir}/opt/${_pkgname}/Paks/"

	cp -r "${srcdir}"/*.ini "${pkgdir}/opt/${_pkgname}/"
	cp -r "${srcdir}"/reshade-shaders "${pkgdir}/opt/${_pkgname}/"
}
