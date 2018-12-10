# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=9.0.1

pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="https://www.sweetscape.com/010editor/"
license=('custom')
depends=('qt5-tools' 'libpng')
makedepends=('fakechroot')
_urlver=${pkgver//./}

source=('010editor.desktop')
source_i686=(https://www.sweetscape.com/download/010EditorLinux32Installer$_urlver.tar.gz)
source_x86_64=(https://www.sweetscape.com/download/010EditorLinux64Installer$_urlver.tar.gz)
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')
sha256sums_i686=('6c413ce6396890fdb2c120dcbc2e57b9e3727354095bc167735f9f84b3604487')
sha256sums_x86_64=('a00221e1e586254027d215e5a16b9ef1caa05ab451b16487895af52397d49c40')

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
