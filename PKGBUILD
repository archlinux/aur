# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# You'll need to download the package archive from
# https://www.blackmagicdesign.com/products/davinciresolve

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

pkgname=davinci-resolve
_pkgname=resolve
resolve_app_name=com.blackmagicdesign.resolve
pkgver=15.2.2
pkgrel=2
pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
arch=('x86_64')
url="https://www.blackmagicdesign.com/"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'libpng12' 'lib32-libpng12' 'ocl-icd' 'openssl-1.0'
         'opencl-driver' 'qt4' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'libisoburn'
         'qt5-webengine' 'qt5-websockets' 'xdg-user-dirs')
options=('!strip')
conflicts=('davinci-resolve-beta' 'davinci-resolve-studio' 'davinci-resolve-studio-beta')

# Trying to make the user's life easier ;o)
msg2 "Trying to fetch the archive file if available..."
DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`

if [ ! -f ${pkgdir}/DaVinci_Resolve_${pkgver}_Linux.zip ]; then
	if [ -f $DOWNLOADS_DIR/DaVinci_Resolve_${pkgver}_Linux.zip ]; then
		ln -sfn $DOWNLOADS_DIR/DaVinci_Resolve_${pkgver}_Linux.zip ${pkgdir}
	else
		msg2 ""
		msg2 "The package can be downloaded here: https://www.blackmagicdesign.com/products/davinciresolve/"
		msg2 "Please remember to put a downloaded package DaVinci_Resolve_${pkgver}_Linux.zip into the build directory ${PWD} or $DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://DaVinci_Resolve_${pkgver}_Linux.zip")
sha256sums=('4330673cbe62f1ce2292d0357e20503233124bbb5a1b7752ce83b4befcf29497')

package()
{
	msg2 "Creating missing folders..."
	mkdir -p -m 0775 "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}
	mkdir -p "${pkgdir}/usr/share/"{applications,desktop-directories}
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
	mkdir -p "${pkgdir}/etc/xdg/menus"

	msg2 "Extracting from bundle..."
	cd "${srcdir}" || exit
	xorriso -osirrox on -indev DaVinci_Resolve_${pkgver}_Linux.run -extract / "${pkgdir}/opt/${_pkgname}"

	msg2 "Add lib symlinks..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	ln -s /usr/lib/libcrypto.so.1.0.0 libs/libcrypto.so.10
	ln -s /usr/lib/libssl.so.1.0.0 libs/libssl.so.10

	msg2 "Install launchers and configs..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	install -Dm666 share/default-config-linux.dat "${pkgdir}/opt/${_pkgname}/configs/config.dat"
	install -Dm666 share/log-conf.xml "${pkgdir}/opt/${_pkgname}/configs/log-conf.xml"
	install -Dm666 share/default_cm_config.bin "${pkgdir}/opt/${_pkgname}/DolbyVision/config.bin"
	install -Dm644 share/DaVinciResolve.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}.desktop"
	install -Dm644 share/DaVinciResolvePanelSetup.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-Panels.desktop"
	install -Dm644 share/DaVinciResolveInstaller.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-Installer.desktop"
	install -Dm644 share/DaVinciResolveCaptureLogs.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-CaptureLogs.desktop"
	install -Dm644 share/DaVinciResolve.directory "${pkgdir}/usr/share/desktop-directories/${resolve_app_name}.directory"
	install -Dm644 share/DaVinciResolve.menu "${pkgdir}/etc/xdg/menus/${resolve_app_name}.menu"

	for _file in $(find ${pkgdir}/usr/share ${pkgdir}/etc -type f -name *.desktop -o -name *.directory -o -name *.menu | xargs)
	do
		sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" $_file
	done

	msg2 "Creating and installing udev rules..."
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-davincipanel.rules"
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="1edb", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-sdx.rules"
	chmod 644 "${pkgdir}/usr/lib/udev/rules.d/"{75-davincipanel.rules,75-sdx.rules}

	msg2 "Any final tweaks..."
	ln -s "/tmp/${_pkgname}/logs" "${pkgdir}/opt/${_pkgname}/logs"
	ln -s "/tmp/${_pkgname}/GPUCache" "${pkgdir}/opt/${_pkgname}/GPUCache"

	msg2 "Done!"
}

# vim: fileencoding=utf-8 sts=4 sw=4 noet
