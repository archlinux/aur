# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Brian Li <brian14708@gmail.com>
# Contributor: Denys Zariaiev <denys.zariaiev@gmail.com>

# TODO 2.0.0 - they're using trying to copy Sphere.stl and others with wrong capitalization...
#Error copying file: boost::filesystem::copy_file: No such file or directory [system:2]: "Resources/Model/ExampleModel/sphere.stl", "/home/c0rn3j/.local/share/chituboxResource/sphere.stl"
#Error copying file: boost::filesystem::copy_file: No such file or directory [system:2]: "Resources/Model/ExampleModel/cylinder.STL", "/home/c0rn3j/.local/share/chituboxResource/cylinder.STL"

# TODO - maybe patch out whatever version check this thing is trying to run
#SOFTWARE_VERSION_ID: v2.0.0
#urlPath:https://sac.chitubox.com/PCVersionUpdate/getInfo.do6?softwareType=17839&platform=4&majorVersion=2.0.0&silentVersion=0.0.0&login=0&customerMail=0startOpt 172 QSqlError("1555", "Unable to fetch row", "UNIQUE constraint failed: AdnormalTable.pid")

pkgname=chitubox-free-bin
pkgver=2.3.1
pkgrel=2
_RUNFILE='chitubox-free-bin-2.3.1'

pkgdesc='All-in-one SLA/DLP/LCD Slicer'

depends=(
	'dbus'
	'glib2'
	'hicolor-icon-theme'
	'zlib'
)
makedepends=(
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

# Free - https://sac.chitubox.com/getSoftwareBySoftwareId.do2?softwareId=17839
#    "stableVersion":  "v2.3.0",
#    "bateVersion":    "v2.2.0",
#    "stableLinuxUrl": "https://download.chitubox.com/17839/v2.3.0/CHITUBOX_Basic_Linux_Installer_V2.3.tar.gz",
#    "betaLinuxUrl":   "https://download.chitubox.com/17839/v2.2.0/CHITUBOX_Basic_Linux_Installer_V2.2_Beta.tar.gz",

# Pro - https://sac.chitubox.com/getSoftwareBySoftwareId.do2?softwareId=17842
#    "stableVersion": "v2.0.8",
#    "bateVersion":   "v2.0.7",

source=(
	# Annoying to get when new URL when it changes due to using window.open, just hog the connection and quickly CTRL+L & CTRL+C when the tab opens before it closes
	# Smarter solutions welcome
	"${pkgname}-${pkgver}::https://sac.chitubox.com/software/download.do?installerUrl=https%3A%2F%2Fdownload.chitubox.com%2F17839%2Fv2.3.1%2FCHITUBOX_Basic_linux_Installer_2.3.1&softwareId=17839&softwareVersionId=v2.3.1"
	'local://chitubox-basic.desktop'
	'local://chitubox-basic.xml'
)

sha256sums=('397e058de53b692e1db61657929e1ce9f88f090cb973c8c20fde5b0d4dfa6268'
            'f3cb140e804119201d7efff6f23558eaa48278c213cb37848fb3ff1afc30deac'
            'fede9c1383063dbfade24289c1adeda505f2333b1206865a6696f0a9f6c7390b')

package()
{
	# Use a path close to the default in the installer
	_INSTALL_ROOT="${srcdir}/opt/CHITUBOX_Basic"
	_OPT_DIR="${pkgdir}/opt"
	_APP_DIR="${_OPT_DIR}/CHITUBOX_Basic"

	# Run installer, which unfortunately doesn't run without root privileges. So it's not possible to put the install in build().
	chmod +x "${srcdir}/${_RUNFILE}"
	"${srcdir}/${_RUNFILE}" --root "${_INSTALL_ROOT}" --accept-licenses --no-size-checking --accept-messages --confirm-command install

	## Clean up
	# Nice 35MB Uninstall binary and some other garbage
	rm "${_INSTALL_ROOT}/Uninstall"*
	rm "${_INSTALL_ROOT}/InstallationLog.txt"
	# Installer installs everything for Linux, macOS and Windows, including 330MB of ffmpeg .exe's
	rm "${_INSTALL_ROOT}"/bin/Resources/DependentSoftware/recordOrShot/*.exe

	# Install License
	install -Dm644 "${_INSTALL_ROOT}/Licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# binary data
	install -d "${pkgdir}"/opt
	mv "${_INSTALL_ROOT}" "${_OPT_DIR}/"

	# launcher
	install -d "${pkgdir}"/usr/bin
	ln -s /opt/CHITUBOX_Basic/CHITUBOX_Basic.sh "${pkgdir}/usr/bin/chitubox-basic"

	# desktop file
	install -Dm644 chitubox-basic.desktop "${pkgdir}"/usr/share/applications/chitubox-basic.desktop

	# Extract the included Windows ICO file into PNG(s)
	icotool --extract "${_APP_DIR}/bin/Resources/Image/SoftwareIcon/freeIcon.ico" --output .
	install -Dm644 freeIcon_1_256x256x32.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chitubox-basic.png"

	# mime/associations - see https://manual.chitubox.com/user-manual-pro/requirements/
	install -Dm644 chitubox-basic.xml "${pkgdir}"/usr/share/mime/packages/chitubox-basic.xml
}
