# Maintainer: Young Acinonyx <young [dot] acinonyx [at] gmail [dot] com>

pkgname=final-fight-lns-ultimate
_pkgname=fflns
_filename="Final Fight LNS Ultimate"
_urlname="${_filename// /%20}"
_appimage="${_filename// /_}"
pkgver=04.2
_pkgver=402
_shadersver=5.4.2
pkgrel=1
pkgdesc="A beat'em up game that mixes concepts and movements from beat'em up and fighting games"
arch=('x86_64')
url="https://fflnsultimate.firebaseapp.com/home"
license=('custom')
depends=('alsa-lib' 'glibc' 'libogg' 'libpng' 'libvorbis' 'libvpx1.7' 'libx11' 'sdl2-compat' 'sdl2_gfx' 'zlib')
optdepends=(
	'pulseaudio: PulseAudio support'
	'pipewire-pulse: PipeWire support as a replacement for PulseAudio'
)
options=(!strip)
source=("${_filename} V${pkgver} Linux x64.tar.gz::https://archive.org/download/${pkgname}-v-${pkgver}-linux-x-64.tar/${_urlname}%20V${pkgver}%20Linux%20x64.tar.gz"
	"${_filename} V04 Reshade ${_shadersver}.7z::https://archive.org/download/${pkgname}-v-04-reshade-${_shadersver}.7z/${_urlname}%20V04%20Reshade%20${_shadersver}.7z"
	"${_filename} V.${pkgver} - PAK.zip::https://archive.org/download/${pkgname}-v-${pkgver}-pak/${_urlname}%20V${pkgver}%20-%20PAK.zip"
	"LICENSE")
sha256sums=('3f99a5e122ccfccfabe9a21f5edacb2aeaf914d59cfd1b6b56535e1d585f0b10'
	    'f484591f62b9fc1b23632e206e8ab9a48ae4d8d1340d8ace9396e7cc25d712ad'
	    '6d3eefc1e9d029c4e0f72e8c631ce33360585ed3ab7707499739bf7e26e38fa6'
	    'f84fd3e54d588a099b8b8f5f6d1266b5d66a41dfc8a8ef35540f6d9e4d05ec46')

prepare() {
	chmod +x "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_appimage}-${arch}.AppImage"
	"${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_appimage}-${arch}.AppImage" --appimage-extract 'usr/bin/OpenBOR'
	rm "${srcdir}/opengl32.dll"
	mv "${srcdir}/${_pkgname}_v${_pkgver//0/_}/openbor.desktop" "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.desktop"
	mv "${srcdir}/${_pkgname}_v${_pkgver//0/_}/openbor.png" "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.png"
	sed -i "s_Exec=OpenBOR_Exec=${_pkgname}_g" "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.desktop"
	sed -i "s_Icon=openbor.png_Icon=/usr/share/pixmaps/${_pkgname}.png_g" "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.desktop"
}

package() {
	install -dm777 "${pkgdir}/opt/${_pkgname}/Logs"
	install -dm755 "${pkgdir}/opt/${_pkgname}/Paks"
	install -dm777 "${pkgdir}/opt/${_pkgname}/Saves"
	install -dm777 "${pkgdir}/opt/${_pkgname}/ScreenShots"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -dm755 "${pkgdir}/usr/share/applications"
	install -dm755 "${pkgdir}/usr/share/licenses/final-fight-lns-ultimate"

	install -Dm644 "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/fflns.png"
	install -Dm644 "${srcdir}/${_pkgname}_v${_pkgver//0/_}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/final-fight-lns-ultimate/"
	install -Dm755 "${srcdir}/squashfs-root/usr/bin/OpenBOR" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

	echo -e '#!/bin/bash'"\n\n(cd /opt/${_pkgname}/ ; /opt/${_pkgname}/${_pkgname})" > "${pkgdir}/usr/bin/${_pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "${srcdir}/Final Fight LNS.pak" "${pkgdir}/opt/${_pkgname}/Paks/"
	cp -r "${srcdir}"/*.ini "${pkgdir}/opt/${_pkgname}/"
	cp -r "${srcdir}"/reshade-shaders "${pkgdir}/opt/${_pkgname}/"
}
