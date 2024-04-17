# Maintainer: Martin Rys <rys.rs/contact>

# Previous maintainers:
#   Brian Li <brian14708@gmail.com>
#   Denys Zariaiev <denys.zariaiev@gmail.com>

# TODO 2.0.0 - they're using trying to copy Sphere.stl and others with wrong capitalization...
#Error copying file: boost::filesystem::copy_file: No such file or directory [system:2]: "Resources/Model/ExampleModel/sphere.stl", "/home/c0rn3j/.local/share/chituboxResource/sphere.stl"
#Error copying file: boost::filesystem::copy_file: No such file or directory [system:2]: "Resources/Model/ExampleModel/cylinder.STL", "/home/c0rn3j/.local/share/chituboxResource/cylinder.STL"

# TODO - maybe patch out whatever version check this thing is trying to run
#SOFTWARE_VERSION_ID: v2.0.0
#urlPath:https://sac.chitubox.com/PCVersionUpdate/getInfo.do6?softwareType=17839&platform=4&majorVersion=2.0.0&silentVersion=0.0.0&login=0&customerMail=0startOpt 172 QSqlError("1555", "Unable to fetch row", "UNIQUE constraint failed: AdnormalTable.pid")

pkgname=chitubox-free-bin
pkgver=2.1.0
RUNFILE='CHITUBOX_Basic_Linux_Installer_V2.1.run'

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
	"${pkgname}-${pkgver}.tar.gz::https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v${pkgver}&fileName=CHITUBOX_V${pkgver}.tar.gz"
	'local://chitubox-basic.desktop'
	'local://chitubox-basic.xml'
)

sha256sums=('9b14dce266132a08c0534076e1c93b5f7186b35885e96746a6b1836285071743'
            'f3cb140e804119201d7efff6f23558eaa48278c213cb37848fb3ff1afc30deac'
            'fede9c1383063dbfade24289c1adeda505f2333b1206865a6696f0a9f6c7390b')

package()
{
	# Use a path close to the default in the installer
	INSTALL_ROOT="${srcdir}/opt/CHITUBOX_Basic"
	OPT_DIR="${pkgdir}/opt"
	APP_DIR="${OPT_DIR}/CHITUBOX_Basic"

	# Run installer, which unfortunately doesn't run without root privileges. So it's not possible to put the install in build().
	"${srcdir}/${RUNFILE}" --root "${INSTALL_ROOT}" --accept-licenses --no-size-checking --accept-messages --confirm-command install

	## Clean up
	# Nice 35MB Uninstall binary and some other garbage
	rm "${INSTALL_ROOT}/Uninstall"*
	rm "${INSTALL_ROOT}/InstallationLog.txt"
	# Installer installs everything for Linux, macOS and Windows, including 330MB of ffmpeg .exe's
	rm "${INSTALL_ROOT}"/bin/Resources/DependentSoftware/recordOrShot/*.exe

	# Install License
	install -Dm644 "${INSTALL_ROOT}/Licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# binary data
	install -d "${pkgdir}"/opt
	mv "${INSTALL_ROOT}" "${OPT_DIR}/"

	# launcher
	install -d "${pkgdir}"/usr/bin
	ln -s /opt/CHITUBOX_Basic/CHITUBOX_Basic.sh "${pkgdir}/usr/bin/chitubox-basic"

	# desktop file
	install -Dm644 chitubox-basic.desktop "${pkgdir}"/usr/share/applications/chitubox-basic.desktop

	# Extract the included Windows ICO file into PNG(s)
	icotool --extract "${APP_DIR}/bin/Resources/Image/SoftwareIcon/freeIcon.ico" --output .
	install -Dm644 freeIcon_1_256x256x32.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chitubox-basic.png"

	# mime/associations - see https://manual.chitubox.com/user-manual-pro/requirements/
	install -Dm644 chitubox-basic.xml "${pkgdir}"/usr/share/mime/packages/chitubox-basic.xml
}
