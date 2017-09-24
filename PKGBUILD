# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=8.0

pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="https://www.sweetscape.com/010editor/"
license=('custom')
depends=('qt5-tools' 'libpng12')
makedepends=('fakechroot')
_urlver=${pkgver//./}

source=('010editor.desktop')
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')

source_i686=(https://download.sweetscape.com/010EditorLinux32Installer$_urlver.tar.gz)
source_x86_64=(https://download.sweetscape.com/010EditorLinux64Installer$_urlver.tar.gz)

sha256sums_i686=('94d81558ff0c0d8375a68b5250d509d1dbcd5aa61544b0fbf2d644ab095390ad')
sha256sums_x86_64=('741a0cdad18bbcbe3661f736fd7d3227162f9b50e315a39c7524965900dfb595')

package() {
	cd "${srcdir}"

	_source=source_${CARCH}
	_filename=${!_source##*/}
	_installer=${_filename%%$_urlver*}

	install -dm 755 "${pkgdir}/opt"

	msg "Entering fakechroot environment..."
	msg2 "Running installer..."

	mkdir "${pkgname}-${pkgver}"
	ln -s {/etc,/tmp} "${_}/"
	ln -s "${pkgdir}/opt" "${_}/"
	ln -s "${srcdir}/${_installer}" "${_}/"

	fakechroot -s chroot "${_}" \
		./${_installer} --mode silent --prefix "/opt/${pkgname}"

	# Clean up unnecessary items (assitant is part of qt5-tools)
	rm -r "${pkgdir}/opt/${pkgname}/"{'assistant','uninstall'}

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/010editor" "${_}/010editor"

	install -dm 755 "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/${pkgname}/010_icon_128x128.png" "${_}/010editor.png"

	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/opt/${pkgname}/license.txt" "${_}/license.txt"

	install -Dm 644 '010editor.desktop' "${pkgdir}/usr/share/applications/010editor.desktop"
}
