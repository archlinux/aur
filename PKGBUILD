# Maintainer: chadsr <git at ross dot ch>

pkgname=creality-print-appimage
pkgver=7.2.1 # renovate: datasource=github-releases depName=CrealityOfficial/CrealityPrint
pkgrel=1
_build_id=5476
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://github.com/CrealityOfficial/CrealityPrint"
license=('AGPL-3.0-only')
depends=('fuse2')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="CrealityPrint-V${pkgver}.${_build_id}-${arch[0]}.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
sha512sums_x86_64=('6371ddf6bc11e74dc84e27e5c62a29c36bae0fc30eb2385aba9a1501e9ab563c2af4dc01cecc9dc224a6308bb011e830890921543cc8f07a80df5216cbaae145'
	'7e038ab385f767433de39e8686f29c096fe6d5967e74f185570d37786583554957e483f14489a512fa652048dfcffc10ccc1782d20645e04d2759d475f88b65a')
source_x86_64=(
	"${_filename}::https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${pkgver}/CrealityPrint-V${pkgver}.${_build_id}-${arch[0]}-Release.AppImage"
	"CrealityPrint.desktop.patch"
)

prepare() {
	cd "${srcdir}" || exit

	# Extract desktop file and application icon from AppImage
	chmod +x "./${_filename}"
	./"${_filename}" --appimage-extract "CrealityPrint.*"
	patch -Np0 <./CrealityPrint.desktop.patch
}

package() {
	cd "${srcdir}" || exit

	# Install AppImage and symlink it
	install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
	install -dm755 "${pkgdir}/usr/bin/"
	ln -s "${_install_path}" "${pkgdir}/usr/bin/${provides[0]}"
	# Install desktop file and application icon
	install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
	install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.png" "${pkgdir}/usr/share/icons/${provides[0]}.png"
}
