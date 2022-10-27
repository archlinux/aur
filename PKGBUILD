# Maintainer: kumen
pkgname="stmcufinder"
pkgver=5.0.0
pkgrel=1
pkgdesc="STM32 and STM8 product finder for desktops"
arch=("x86_64")
depends=('java-runtime')
optdepends=()
conflicts=()
url="https://www.st.com/en/development-tools/st-mcu-finder.html"
_pkg_file_name=en.ST-MCU-FinderLin_v5-0-0.zip
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: ${url}"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('cca7de0b0fcd363c9f07d4c4549c05a4f83bb27373a207702a0d2dbbfe5609a1')

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
	./SetupSTMCUFinder-${pkgver} auto-install.xml
	
	rm ${pkgdir}/opt/${pkgname}/.installationinformation

        msg2 'Installing desktop shortcuts and icon'
	convert "${pkgdir}/opt/${pkgname}/util/STMCUFinder.ico" "${pkgdir}/opt/${pkgname}/util/STMCUFinder.png"
	install -Dm 644 "${pkgdir}/opt/${pkgname}/util/STMCUFinder.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=ST MCU Finder
Comment=ST MCU Finder 5.0.0
GenericName=ST MCU Finder
Exec=STMCUFinder %F
Icon=stmcufinder.png
Path=/opt/stmcufinder/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END

	msg2 'Instalation of binary file'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
/opt/${pkgname}/STMCUFinder "\$@"
END
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/STMCUFinder" <<END
#!/bin/sh
/opt/${pkgname}/STMCUFinder "\$@"
END

	msg2 'Fix folder permissions'
	chmod 755 "${pkgdir}/opt/${pkgname}/jre"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
