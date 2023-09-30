# Maintainer: taotieren <admin@taotieren.com>

pkgname=stm8cubemx
pkgver=1.5.0
pkgrel=2
epoch=
_pkg_file_name=en.${pkgname}_v${pkgver}.zip
pkgdesc="STM8CubeMX: a user-friendly software tool that uses graphical wizards to configure STM8 microcontrollers"
arch=(any)
url="https://www.st.com/en/development-tools/stm8cubemx.html"
license=('custom')
groups=()
depends=('java-runtime>=17'
    'archlinux-java-run'
    'bash')
makedepends=('imagemagick' 'xdg-user-dirs')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "Package not found!"
		msg2 "The package can be downloaded here: ${url}"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}")
noextract=()
sha256sums=('bb2a967d78787535554e4f7a1256aea8a957e011a926539e4d89bac20101f561')
validpgpkeys=()

package() {
    # install stm8cubemx
    cat << EOF > auto-install_custom.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
<com.st.microxplorer.install.MXHTMLHelloPanel id="readme"/>
<com.st.microxplorer.install.MXLicensePanel id="licence.panel"/>
<com.st.microxplorer.install.MXTargetPanel id="target.panel">
<installpath>$pkgdir/opt/$pkgname/</installpath>
</com.st.microxplorer.install.MXTargetPanel>
<com.st.microxplorer.install.MXShortcutPanel id="shortcut.panel"/>
<com.st.microxplorer.install.MXInstallPanel id="install.panel"/>
<com.st.microxplorer.install.MXFinishPanel id="finish.panel"/>
</AutomatedInstallation>
EOF
    java -jar "${srcdir}/SetupSTM8CubeMX-${pkgver}.exe" "auto-install_custom.xml"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash
exec archlinux-java-run --min 17 -- -jar /opt/${pkgname}/STM8CubeMX "\$@"
EOF

    #icon and desktop file
    convert "${pkgdir}/opt/${pkgname}/help/STM8CubeMX.ico[16]" "${srcdir}/${pkgname}.png"
    install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm 644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=STM8CubeMX
GenericName=configuration tool for STM8 microcontrollers
Comment=${pkgdesc}
Icon=${pkgname}.png
Exec=${pkgname}
Terminal=false
Categories=Development;IDE;
StartupNotify=false
EOF

    # license
    install -dm0644 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "/opt/stm8cubemx/help/software_license_agreement_SLA0048.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
