# Maintainer: kumen
pkgname="stmcufinder"
pkgver=3.1.0
pkgrel=1
pkgdesc="STM32 and STM8 product finder for desktops"
arch=("x86_64")
depends=('java-runtime')
optdepends=()
conflicts=()
url="https://www.st.com/en/development-tools/st-mcu-finder.html"
_pkg_file_name=en.st-mcu-finder-pc.zip
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: "
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}"
	$pkgname.desktop)
sha256sums=('74f71973129a018f8233c3cc580c4a82516760b3c2ea5d3451d41d6743b34726'
	'3f6e5143662f412d52b59818c243d2a172cece73670a457d8ec4271df3e9addb')

prepare(){
	cd "$srcdir"
	cat <<EOF > auto-install.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
    <com.izforge.izpack.panels.checkedhello.CheckedHelloPanel id="checkedhello.panel"/>
    <com.izforge.izpack.panels.licence.LicencePanel id="licence.panel"/>
    <com.st.microxplorer.install.FinderTargetPanel id="target.panel">
        <installpath>${pkgdir}/opt/${pkgname}</installpath>
    </com.st.microxplorer.install.FinderTargetPanel>
    <com.st.microxplorer.install.MXShortcutPanel id="shortcut.panel"/>
    <com.st.microxplorer.install.MXInstallPanel id="install.panel"/>
    <com.st.microxplorer.install.FinderFinishPanel id="finish.panel"/>
</AutomatedInstallation>
EOF
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	./SetupSTMCUFinder-${pkgver}.linux auto-install.xml
	
	rm ${pkgdir}/opt/${pkgname}/.installationinformation

        msg2 'Installing desktop shortcuts'
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
