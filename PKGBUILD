# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Edward Wawrzynek <edward@wawrzynek.com>

pkgname=xrcsimulator
pkgver=10.0d
pkgdesc="FIRST Tech Challenge, FIRST Robotics Competition, and VEX Simulator"
pkgrel=1
arch=('x86_64')
url="http://xrcsimulator.org"
license=('unknown')
depends=("zlib" 
	 "bash")
optdepends=('openvr: For VR support')
replaces=('ftcfrcsimulator')

# Base name of files in the zip
_files_name="xRC Simulator"

source=(
	"${pkgname}-${pkgver}.zip::http://xrcsimulator.org/?smd_process_download=1&download_id=2053"
	"xrcsimulator.desktop"
)

sha1sums=('e17b92eb34bfdef8d0303895b44d85bc57a6f574'
          '07ee699a267425f01c7e28c2369ba6521bd515ec')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/xrcsimulator" "${pkgdir}/usr/bin"
	# Copy data to /usr/share, set directory permissions to 755, file permissions to 644
	cp -r "${_files_name}_Data" "${pkgdir}/usr/share/xrcsimulator/"
	chmod -R 0755 "${pkgdir}/usr/share/xrcsimulator"
	find "${pkgdir}/usr/share/xrcsimulator/" -type f -exec chmod 644 {} \;

	# Copy binaries over
	install -Dm755 "${_files_name}.x86_64" "${pkgdir}/usr/share/xrcsimulator/${_files_name}.x86_64"
	install -Dm755 "UnityPlayer.so" "${pkgdir}/usr/share/xrcsimulator/UnityPlayer.so"

	# Put a script in /usr/bin to run app
	cat <<EOF > "${pkgdir}"/usr/bin/xrcsimulator
#!/bin/bash
"/usr/share/xrcsimulator/${_files_name}.x86_64"
EOF
	chmod 0755 "${pkgdir}"/usr/bin/xrcsimulator
	# Desktop Entry
	install -Dm644 xrcsimulator.desktop "${pkgdir}/usr/share/applications/xrcsimulator.desktop"

	# Logo
	cd "${srcdir}"
	install -Dm644 "${_files_name}_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/xrcsimulator.png"
}
