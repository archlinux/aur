# Maintainer: Young Acinonyx <young dot acinonyx at gmail dot com>

pkgname=printmyfonts
_pkgname=PrintMyFonts
pkgver=24.3.21
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
	source=("${pkgname}-${pkgver}-${CARCH}.zip::https://www.sttmedia.com/downloads/${_pkgname}Deb.zip"
	"LICENSE")
	sha256sums=('090e1448d9d6239d1761d1e5275f1c39de3745704522577c52cc5a2d6869e94e'
                    '645c06b84421e972693c3e2e47758d2e9a22bdf43ffb56b703bd1beec1710d4c')
fi

if [[ $CARCH == 'x86_64' ]]
then
	_CARCH='amd64'
	source=("${pkgname}-${pkgver}-${CARCH}.zip::https://www.sttmedia.com/downloads/${_pkgname}Deb64.zip"
	"LICENSE")
	sha256sums=('f6349b8fee215f5e225a33593620bd3d8939c8a2add31144590f6c9ab7314a0b'
		    '645c06b84421e972693c3e2e47758d2e9a22bdf43ffb56b703bd1beec1710d4c')

fi

prepare() {
	cd "${srcdir}"

	# If "${pkgname}-${pkgver}-${CARCH}" doesn't exists, create it.
	[ -d "${pkgname}-${pkgver}-${CARCH}" ] || mkdir "${pkgname}-${pkgver}-${CARCH}"

	# Extract the .deb file
	ar x ${pkgname}_${pkgver}-1_${_CARCH}.deb --output "${pkgname}-${pkgver}-${CARCH}"
	
	# Remove unnecessary files
	rm "${pkgname}-${pkgver}-${CARCH}"/{control.tar.gz,debian-binary}

	# Extract the installation files
	tar -Jxf "${pkgname}-${pkgver}-${CARCH}"/data.tar.xz -C "${pkgname}-${pkgver}-${CARCH}"
}

package() {
	cd "${pkgname}-${pkgver}-${CARCH}"

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
