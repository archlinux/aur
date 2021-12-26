# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

# This was originally written by Daniel Bermond in blackmagic-decklink-sdk pkgbuild
# It is sufficient to just replace _downloadid to correspond new release version
# It can be obtained from chromium -> Developer Tools -> Network -> XHR -> click latest-version and copy downloadId
_downloadid='9f63a591c6db46bd8dc8dd41aad1daf9'
_referid='a29cf086ee72457e96b8c2ae586a3e00'
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
    \"product\": \"DaVinci Resolve\" \
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
pkgver=17.4.3
pkgrel=1
arch=('any')
url="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion"
license=('Commercial')
depends=('glu' 'gtk2' 'gstreamer' 'libpng12' 'lib32-libpng12' 'ocl-icd' 'openssl-1.0' 'fuse2'
		 'opencl-driver' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-webengine' 'qt5-websockets')
makedepends=('libarchive' 'xdg-user-dirs')
options=('!strip')
provides=('davinci-resolve')
install=davinci-resolve.install

if [ ${pkgname} == "davinci-resolve-studio" ]; then
# Variables for STUDIO edition
	pkgdesc='Professional A/V post-production software suite from Blackmagic Design. Studio edition, requires license key or license dongle.'
	_archive_name=DaVinci_Resolve_Studio_${pkgver}_Linux
	sha256sums=('834038c18c5a8f6e7f839004f413769775432630e14c717c2e87befe257261b1')
	conflicts=('davinci-resolve-beta' 'davinci-resolve' 'davinci-resolve-studio-beta')
else
# Variables for FREE edition
	pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
	_archive_name=DaVinci_Resolve_${pkgver}_Linux
	sha256sums=('d9b9bbde5671dfddb37229b51f2fd80fd158a1a333acf2f4860946a52224a135')
	conflicts=('davinci-resolve-studio' 'davinci-resolve-beta' 'davinci-resolve-studio-beta')
fi

_archive=${_archive_name}.zip
_installer_binary=${_archive_name}.run

if [ ! -f ${PWD}/${_archive} ]; then
	DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
	if [ -f $DOWNLOADS_DIR/${_archive} ]; then
		ln -sfn $DOWNLOADS_DIR/${_archive} ${PWD}
		source=("local://${_archive}")
	else
		source=("${_archive}"::"$_srcurl")
	fi
else
	source=("local://${_archive}")
fi

prepare()
{
	# Remove udev rules (The official installer does not remove these files. This leads to the conflict "exists in the file system".)
	confiles=$(find /usr/lib/udev/rules.d -name 75-davincipanel.rules -o -name 75-sdx.rules 2> /dev/null | awk -F/ '{print $NF}'
               find /opt/resolve/configs -name log-conf.xml -o -name config.dat 2> /dev/null | awk -F/ '{print $NF}'
               )
	if [ "${confiles}" ]; then
		echo -e "\033[1m==> The file(s) $(echo ${confiles} | xargs | sed 's/ /, /g') already exist in your filesystem.\033[0m"
		echo -e "\033[1m==> This can lead to a conflict and the installation will fail.\033[0m"
		echo -e "\033[1m==> Please restart the installation with the --overwrite option.\033[0m"
	fi
}

package()
{
	echo -e "\033[1m==> Creating missing folders...\033[0m"
	mkdir -p -m 0775 "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,GPUCache,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}
	mkdir -p "${pkgdir}/usr/share/"{applications,desktop-directories,icons/hicolor,mime/packages}
#	mkdir -p "${pkgdir}/tmp/${_pkgname}/"{logs,GPUCache}
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
	mkdir -p "${pkgdir}/etc/xdg/menus"

	echo -e "\033[1m==> Extracting from bundle...\033[0m"
	echo -e "\033[1mPlease wait, this take a while...\033[0m"
	cd "${srcdir}" || exit
	chmod u+x ./${_installer_binary}
	./${_installer_binary} -i -y -n -a -C "${pkgdir}/opt/${_pkgname}"
	rm -rf ${_installer_binary}

#### No longer necessary
#	echo -e "\033[1m==> Add lib symlinks...\033[0m"
#	cd "${pkgdir}/opt/${_pkgname}/" || exit
#	ln -s /usr/lib/libcrypto.so.1.0.0 libs/libcrypto.so.10
#	ln -s /usr/lib/libssl.so.1.0.0 libs/libssl.so.10
####

	echo -e "\033[1m==> Install launchers and configs...\033[0m"
	cd "${pkgdir}/opt/${_pkgname}/" || exit
	install -Dm666 share/default-config.dat "${pkgdir}/opt/${_pkgname}/configs/config.dat"
	install -Dm666 share/log-conf.xml "${pkgdir}/opt/${_pkgname}/configs/log-conf.xml"
	install -Dm666 share/default_cm_config.bin "${pkgdir}/opt/${_pkgname}/DolbyVision/config.bin"
	install -Dm644 share/DaVinciResolve.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}.desktop"
	install -Dm644 share/DaVinciControlPanelsSetup.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-Panels-Setup.desktop"
	install -Dm644 share/DaVinciResolveInstaller.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-Installer.desktop"
	install -Dm644 share/DaVinciResolveCaptureLogs.desktop "${pkgdir}/usr/share/applications/${resolve_app_name}-CaptureLogs.desktop"
	install -Dm644 share/blackmagicraw-player.desktop "${pkgdir}/usr/share/applications/blackmagicraw-player.desktop"
	install -Dm644 share/blackmagicraw-speedtest.desktop "${pkgdir}/usr/share/applications/blackmagicraw-speedtest.desktop"
	install -Dm644 share/DaVinciResolve.directory "${pkgdir}/usr/share/desktop-directories/${resolve_app_name}.directory"
	install -Dm644 share/DaVinciResolve.menu "${pkgdir}/etc/xdg/menus/${resolve_app_name}.menu"

	for _file in $(find ${pkgdir}/usr/share ${pkgdir}/etc -type f -name *.desktop -o -name *.directory -o -name *.menu | xargs)
	do
		sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" $_file
	done

	# This will help adding the app to favorites and prevent glitches on many desktops.
	echo "StartupWMClass=resolve" >> "${pkgdir}/usr/share/applications/${resolve_app_name}.desktop"

	echo -e "\033[1m==> Creating and installing udev rules...\033[0m"
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-davincipanel.rules"
	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="1edb", MODE="0666"' > "${pkgdir}/usr/lib/udev/rules.d/75-sdx.rules"
	chmod 644 "${pkgdir}/usr/lib/udev/rules.d/"{75-davincipanel.rules,75-sdx.rules}

#	Not sure we need it
#	echo -e "\033[1m==> Any final tweaks...\033[0m"
#	ln -s "/tmp/${_pkgname}/logs" "${pkgdir}/opt/${_pkgname}/logs"
#	ln -s "/tmp/${_pkgname}/GPUCache" "${pkgdir}/opt/${_pkgname}/GPUCache"

	echo -e "\033[1m==> Installing Application icons...\033[0m"
	# Obviously not working without root privileges.
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 "${pkgdir}/opt/${_pkgname}/graphics/DV_Resolve.png" DaVinci-Resolve 2>&1 >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 "${pkgdir}/opt/${_pkgname}/graphics/DV_ResolveProj.png" DaVinci-ResolveProj 2>&1 >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/icons/hicolor" xdg-icon-resource install --size 64 --context mimetypes "${pkgdir}/opt/${_pkgname}/graphics/DV_ResolveProj.png" application-x-resolveproj 2>&1  >> /dev/null
#	XDG_DATA_DIRS="${pkgdir}/usr/share/mime/packages" xdg-mime install --novendor "${pkgdir}/opt/${_pkgname}/share/resolve.xml" 2>&1  >> /dev/null
	install -D -m644 graphics/DV_Resolve.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DV_Resolve.png"
	install -D -m644 graphics/DV_ResolveProj.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DV_ResolveProj.png"

	install -D -m644 share/resolve.xml "${pkgdir}/usr/share/mime/packages/resolve.xml"
	
	echo -e "\033[1m==> Setting the right permissions...\033[0m"

	if [ ! "$(logname 2>&1 >/dev/null)" ]; then
		_user=$(logname)
		_group=$(id -g -n ${_user})
	else
		_user=root
		_group=root
	fi

	chown -R ${_user}:${_group} "${pkgdir}/opt/${_pkgname}/"{*,.*}
	chown -R ${_user}:root "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,logs,Media,'Resolve Disk Database',.crashreport,.license,.LUT}

	echo -e "\033[1m==> Done!\033[0m"
}

# vim: fileencoding=utf-8 sts=4 sw=4 noet