# Maintainer: Martin Rys <rys.rs/contact>

# Previous maintainers:
#   Brian Li <brian14708@gmail.com>
#   Denys Zariaiev <denys.zariaiev@gmail.com>

pkgname=chitubox-free-bin
pkgver=2.0.0
RUNFILE='CHITUBOX_Basic_Linux_Installer_V2.0.run'

pkgrel=1
pkgdesc='All-in-one SLA/DLP/LCD Slicer'

makedepends=(
	'dbus'
	'fontconfig'
	'freetype2'
	'icoutils'
	'libx11'
	'libxkbcommon-x11'
	'xcb-util-keysyms'
	'xcb-util-image'
	'xcb-util-renderutil'
	'xcb-util-wm'
)

url='https://www.chitubox.com/download.html'
arch=('x86_64')
license=('LicenseRef-CHITUBOX')

options=(!strip)

source=(
	"$pkgname-$pkgver.tar.gz::https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v${pkgver}&fileName=CHITUBOX_V${pkgver}.tar.gz"
	'local://chitubox-basic.desktop'
	'local://launcher'
	'local://chitubox-basic.xml'
)

sha256sums=('0231fd7183342c6ca5395bd738935bb10abb46c1704e2b13aaf3f73ca9ce7b75'
            '71dfcfa7d2e99e7aea135ec9495eec8a7507863d92ca4bed0b479cede033e04d'
            'a3ac4d1b712ccf4c211245f0b51f51da4d985afbb22cdac4687fffe3427b73c5'
            'fede9c1383063dbfade24289c1adeda505f2333b1206865a6696f0a9f6c7390b')

package()
{
	INSTALL_ROOT="${srcdir}/opt/chitubox-basic"
	OPT_DIR="${pkgdir}/opt"
	APP_DIR="${OPT_DIR}/chitubox-basic"

	# Run installer, which unfortunately doesn't run without root privileges. So it's not possible to put the install in build().
	"${srcdir}/${RUNFILE}" --root "${INSTALL_ROOT}" --accept-licenses --no-size-checking --accept-messages --confirm-command install

	# Clean up
	rm "${INSTALL_ROOT}/Uninstall"* "${INSTALL_ROOT}/InstallationLog.txt"

	# Install License
	install -Dm644 "${INSTALL_ROOT}/Licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# binary data
	install -d "$pkgdir"/opt
	mv "${INSTALL_ROOT}" "${OPT_DIR}/"

	# launcher
	install -d "$pkgdir"/usr/bin
	install -Dm755 launcher "$pkgdir"/usr/bin/chitubox-basic

	# desktop file
	install -Dm644 chitubox-basic.desktop "$pkgdir"/usr/share/applications/chitubox-basic.desktop

	# Extract the included Windows ICO file into PNG(s)
	icotool --extract "${APP_DIR}/bin/Resources/Image/SoftwareIcon/freeIcon.ico" --output .
	install -Dm644 freeIcon_1_256x256x32.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chitubox-basic.png"

	# mime/associations - see https://manual.chitubox.com/user-manual-pro/requirements/
	install -Dm644 chitubox-basic.xml "$pkgdir"/usr/share/mime/packages/chitubox-basic.xml
}
