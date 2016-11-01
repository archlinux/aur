# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>
pkgname=010editor
pkgver=7.0.2
pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="http://www.sweetscape.com/010editor/"
license=('custom')
depends=('qt5-tools')
makedepends=('fakechroot')
options=(!strip)

source=('010editor.desktop')
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')

source_i686=('http://www.sweetscape.com/download/010EditorLinux32Installer.tar.gz')
source_x86_64=('http://www.sweetscape.com/download/010EditorLinux64Installer.tar.gz')

sha256sums_i686=('f3c7f202f4a34e5b3b125acef4bc4dbd6604814d106d4820f2a60563c0097ba1')
sha256sums_x86_64=('f44d4091327264ffa57f0ba2a0a3d50a92f735e41ca71ffc8fc2330d2dafab1c')

package() {
	cd "${srcdir}"

	_source=source_${CARCH}
	_filename=${!_source##*/}
	_installer=${_filename%%.*}

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
