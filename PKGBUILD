# Maintainer: chadsr <git at ross dot ch>

pkgname=creality-print-appimage
pkgver=7.3.0 # renovate: datasource=github-releases depName=CrealityOfficial/CrealityPrint
pkgrel=1
_build_id=6151
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://github.com/CrealityOfficial/CrealityPrint"
license=('AGPL-3.0-only')
depends=('fuse2' 'hicolor-icon-theme')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="CrealityPrint-V${pkgver}.${_build_id}-${arch[0]}.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source_x86_64=(
	"${_filename}::https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${pkgver}/CrealityPrint-V${pkgver}.${_build_id}-${arch[0]}-Release.AppImage"
	"CrealityPrint.desktop.patch"
)
b2sums_x86_64=('82f50585098215c327892271ac8da09c2238785834ae3b72d60b34863b2c18d812d97c31c777fa802c1de9f57b58d4ad9b6fcf84b3de79645f0c9a23497fe60d'
	'ae7b31dda7ca9b311e9781314dc5a552da3fd7161f8ed0bb260ceb88e26bdd9903b2ace17436fb5929daf3ba93faa067f627384cb116c346875fe2864ca41e35')

prepare() {
	cd "${srcdir}"

	# Extract desktop file and application icon from AppImage
	chmod +x "./${_filename}"
	./"${_filename}" --appimage-extract "CrealityPrint.*"
	patch -Np0 <./CrealityPrint.desktop.patch
}

package() {
	cd "${srcdir}"

	# Install AppImage and symlink it
	install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
	install -dm755 "${pkgdir}/usr/bin/"
	ln -s "${_install_path}" "${pkgdir}/usr/bin/${provides[0]}"
	# Install desktop file and application icon
	install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
	install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${provides[0]}.png"
}
