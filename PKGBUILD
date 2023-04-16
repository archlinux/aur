# Maintainer: Young Acinonyx <young dot acinonyx at gmail dot com>

pkgname=printmyfonts
_pkgname=PrintMyFonts
pkgver=22.12.20
pkgrel=1
pkgdesc="A tool to show, print, and/or export an arbitraty text in any font."
arch=('i686' 'x86_64')
url="https://www.sttmedia.com/printmyfonts"
license=('custom')
depends=('gtk2')
makedepends=('binutils')

if [[ $CARCH == 'i686' ]]
then
	_CARCH='i386'
	source=("${pkgname}-${pkgver}.zip::https://www.sttmedia.com/downloads/${_pkgname}Deb.zip"
	"LICENSE")
sha256sums=('9fb1e43ec37e4dcbf894275e675031cbcbea2faa36bcd3532fe30cb93237f63b'
            '76d62cd0ddd0f1285ec8b6d63d3a735457a02f22b4b18b550c34c258e1828ff1')
fi

if [[ $CARCH == 'x86_64' ]]
then
	_CARCH='amd64'
	source=("${pkgname}-${pkgver}.zip::https://www.sttmedia.com/downloads/${_pkgname}Deb64.zip"
	"LICENSE")
sha256sums=('9cefe0d09786171f1c6d18c033f81103f9b074ac5d8a9223d80b7f7d8426c83b'
           '76d62cd0ddd0f1285ec8b6d63d3a735457a02f22b4b18b550c34c258e1828ff1')
fi

prepare() {
	cd "${srcdir}"

	# If "${pkgname}-${pkgver}" doesn't exists, create it.
	[ -d "${pkgname}-${pkgver}" ] || mkdir "${pkgname}-${pkgver}"

	# Extract the .deb file
	ar x ${pkgname}_${pkgver}-1_${_CARCH}.deb --output "${pkgname}-${pkgver}"
	
	# Remove unnecessary files
	rm "${pkgname}-${pkgver}"/{control.tar.gz,debian-binary}

	# Extract the installation files
	tar -Jxf "${pkgname}-${pkgver}"/data.tar.xz -C "${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"

	# Create the necessary directories
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/"{applications,doc,icons,man,pixmaps}
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}-stt"
	install -dm755 "${pkgdir}/usr/share/man/man1"
	
	# Install program files
	install	-Dm755 "usr/bin/${pkgname}-stt" "${pkgdir}/usr/bin/"
	install	-Dm755 "usr/share/applications/${pkgname}-stt.desktop" "${pkgdir}/usr/share/applications/"
	install	-Dm755 "usr/share/doc/${pkgname}-stt/copyright" "${pkgdir}/usr/share/doc/${pkgname}-stt/"
	install	-Dm755 "usr/share/man/man1/${pkgname}-stt.1.gz" "${pkgdir}/usr/share/man/man1/"
	install -Dm755 "usr/share/pixmaps/${pkgname}-stt.png" "${pkgdir}/usr/share/pixmaps/"

	# Install icons
	for SIZE in 16 22 24 32 36 48 64 72 96 128 192 256 512
	do
		# Create directories for every size and install the icons accordingly
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/"${SIZE}x${SIZE}"/apps"
		install -Dm755 "usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${pkgname}-stt.png" "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/"
		
		# Create directory for HiDPI icons and install them (only when applicable)
		if [[ "${SIZE}" -ne "22" ]] && [[ "${SIZE}" -ne "72" ]] && [[ "${SIZE}" -ne "192" ]]
		then
			install -dm755 "${pkgdir}/usr/share/icons/hicolor/"${SIZE}x${SIZE}@2x"/apps" 
			install -Dm755 "usr/share/icons/hicolor/${SIZE}x${SIZE}@2x/apps/${pkgname}-stt.png" "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}@2x/apps/"
		fi

	done

	# Install the custom license file
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
