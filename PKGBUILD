# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

# This was originally written by Daniel Bermond in blackmagic-decklink-sdk pkgbuild
# It is sufficient to just replace _downloadid to correspond new release version
# It can be obtained from chromium -> Developer Tools -> Network -> XHR -> click latest-version and copy downloadId
_downloadid='8c0ce4708141497e9ef2f21feaef000b'
_referid='00e0eb2c5ab94938a1e7088e17b35725'
_siteurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"

_reqjson="{ \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"country\": \"us\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"product\": \"DaVinci Resolve Studio\" \
}"

_reqjson="$(  printf '%s' "$_reqjson"   | sed 's/[[:space:]]\+/ /g')"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_useragent// /\\ }"

_srcurl="$(curl \
            -s \
            -H 'Host: www.blackmagicdesign.com' \
            -H 'Accept: application/json, text/plain, */*' \
            -H 'Origin: https://www.blackmagicdesign.com' \
            -H "$_useragent" \
            -H 'Content-Type: application/json;charset=UTF-8' \
            -H "Referer: https://www.blackmagicdesign.com/support/download/${_referid}/Linux" \
            -H 'Accept-Encoding: gzip, deflate, br' \
            -H 'Accept-Language: en-US,en;q=0.9' \
            -H 'Authority: www.blackmagicdesign.com' \
            -H 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294' \
            --data-ascii "$_reqjson" \
            --compressed \
            "$_siteurl")"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -C - --retry 3 --retry-delay 3 \
              -H Host:\ sw.blackmagicdesign.com \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent_escaped} \
              -H Accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8 \
              -H Accept-Language:\ en-US,en;q=0.9 \
              -o %o \
              --compressed \
              %u")


pkgname=davinci-resolve-studio
_pkgname=resolve
resolve_app_name=com.blackmagicdesign.resolve
pkgver=16.2
pkgrel=2
arch=('any')
url="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'libpng12' 'lib32-libpng12' 'ocl-icd' 'openssl-1.0'
         'opencl-driver' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-webengine' 'qt5-websockets')
makedepends=('libarchive' 'xdg-user-dirs')
options=('!strip')
provides=('davinci-resolve')
install=davinci-resolve.install

if [ ${pkgname} == "davinci-resolve-studio" ]; then
# Variables for STUDIO edition
	pkgdesc='Professional A/V post-production software suite from Blackmagic Design. Studio edition, requires license key or license dongle.'
	_archive_name=DaVinci_Resolve_Studio_${pkgver}_Linux
	sha256sums=('fe4047cf917b0554274d2095312a0865de3af94d394058ce34686dbcc24e0635')
	conflicts=('davinci-resolve-beta' 'davinci-resolve' 'davinci-resolve-studio')
else
# Variables for FREE edition
	pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
	_archive_name=DaVinci_Resolve_${pkgver}_Linux
	sha256sums=('2a3147b58e0b64da802cb04da9d1a1c42bc30558d7a57782e3bdc1a4b4c2cae0')
	conflicts=('davinci-resolve' 'davinci-resolve-studio' 'davinci-resolve-studio-beta')
fi

_archive=${_archive_name}.zip
_installer_binary=${_archive_name}.run

source=("${_archive}"::"$_srcurl")

prepare()
{
	# Remove udev rules (The official installer does not remove these files. This leads to the conflict "exists in the file system".)
	confiles=$(find /usr/lib/udev/rules.d -name 75-davincipanel.rules -o -name 75-sdx.rules 2> /dev/null | awk -F/ '{print $NF}'
               find /opt/resolve/configs -name log-conf.xml -o -name config.dat 2> /dev/null | awk -F/ '{print $NF}'
               )
	if [ "${confiles}" ]; then
		msg2 "The file(s) $(echo ${confiles} | xargs | sed 's/ /, /g') already exist in your filesystem."
		msg2 "This can lead to a conflict and the installation will fail."
		msg2 "Please restart the installation with the --overwrite option."
	fi
}

package()
{
	msg2 "Creating missing folders..."
	mkdir -p -m 0775 "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,GPUCache,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}
	mkdir -p "${pkgdir}/usr/share/"{applications,desktop-directories,icons/hicolor,mime/packages}
#	mkdir -p "${pkgdir}/tmp/${_pkgname}/"{logs,GPUCache}
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
	mkdir -p "${pkgdir}/etc/xdg/menus"

	msg2 "Extracting from bundle..."
	msg "Please wait, this take a while..."
	cd "${srcdir}" || exit
	bsdtar x -f ${_installer_binary} -C "${pkgdir}/opt/${_pkgname}"

	msg2 "Add lib symlinks..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	ln -s /usr/lib/libcrypto.so.1.0.0 libs/libcrypto.so.10
	ln -s /usr/lib/libssl.so.1.0.0 libs/libssl.so.10

	msg2 "Install launchers and configs..."
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	install -Dm666 share/default-config.dat "${pkgdir}/opt/${_pkgname}/configs/config.dat"
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

	# This will help adding the app to favorites and prevent glitches on many desktops.
	echo "StartupWMClass=resolve" >> "${pkgdir}/usr/share/applications/${resolve_app_name}.desktop"

	msg2 "Creating and installing udev rules..."
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-davincipanel.rules"
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="1edb", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-sdx.rules"
	chmod 644 "${pkgdir}/usr/lib/udev/rules.d/"{75-davincipanel.rules,75-sdx.rules}

#	Not sure we need it
#	msg2 "Any final tweaks..."
#	ln -s "/tmp/${_pkgname}/logs" "${pkgdir}/opt/${_pkgname}/logs"
#	ln -s "/tmp/${_pkgname}/GPUCache" "${pkgdir}/opt/${_pkgname}/GPUCache"

	msg2 "Installing Application icons..."
	# Obviously not working without root rights.
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 "${pkgdir}/opt/${_pkgname}/graphics/DV_Resolve.png" DaVinci-Resolve 2>&1 >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 "${pkgdir}/opt/${_pkgname}/graphics/DV_ResolveProj.png" DaVinci-ResolveProj 2>&1 >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 --context mimetypes "${pkgdir}/opt/${_pkgname}/graphics/DV_ResolveProj.png" application-x-resolveproj 2>&1  >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/mime/packages" xdg-mime install --novendor "${pkgdir}/opt/${_pkgname}/share/resolve.xml" 2>&1  >> /dev/null
	install -D -m644 graphics/DV_Resolve.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DV_Resolve.png"
	install -D -m644 graphics/DV_ResolveProj.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DV_ResolveProj.png"

	install -D -m644 share/resolve.xml "${pkgdir}/usr/share/mime/packages/resolve.xml"
	
	msg2 "Setting the right permissions..."

	if [ ! "$(logname 2>&1 >/dev/null)" ]; then
		_user=$(logname)
		_group=$(id -g -n ${_user})
	else
		_user=root
		_group=root
	fi

	chown -R ${_user}:${_group} "${pkgdir}/opt/${_pkgname}/"{*,.*}
	chown -R ${_user}:root "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,logs,Media,'Resolve Disk Database',.crashreport,.license,.LUT}

	msg2 "Done!"
}

# vim: fileencoding=utf-8 sts=4 sw=4 noet
