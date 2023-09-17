# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

# This was originally written by Daniel Bermond in blackmagic-decklink-sdk pkgbuild
# It is sufficient to just replace _downloadid to correspond new release version
# It can be obtained from chromium -> Developer Tools -> Network -> XHR -> click latest-version and copy downloadId

pkgname=davinci-resolve
pkgver=18.6.0
pkgrel=1

if [ "$pkgname" == "davinci-resolve" ]; then
    # Variables for FREE edition
    _product="DaVinci Resolve"
    _referid='cebf954f05a74eaeae6b6b14bcca7971'
    _siteurl="https://www.blackmagicdesign.com/api/support/latest-stable-version/davinci-resolve/linux"
    sha256sums=('18f391cc522a336553a32c0c8c3eb0f47e0f7478687a08aae1acbf49bfa34560')
    pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
    _archive_name=DaVinci_Resolve_${pkgver}_Linux
    conflicts=('davinci-resolve-studio' 'davinci-resolve-beta' 'davinci-resolve-studio-beta')
elif [ "$pkgname" == "davinci-resolve-studio" ]; then
    # Variables for STUDIO edition
    _product="DaVinci Resolve Studio"
    _referid='2cdeb3d6ccfb4e65add749acb36e659b'
    _siteurl="https://www.blackmagicdesign.com/api/support/latest-stable-version/davinci-resolve-studio/linux"
    sha256sums=('85d10ad79ecd033c782bcb6ad27e0cb5ac190e9ef4dbd517282bc4dbe045a080')
    pkgdesc='Professional A/V post-production software suite from Blackmagic Design. Studio edition, requires license key or license dongle.'
    _archive_name=DaVinci_Resolve_Studio_${pkgver}_Linux
    conflicts=('davinci-resolve' 'davinci-resolve-beta' 'davinci-resolve-studio-beta')
fi

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"
_releaseinfo=$(curl -s "$_siteurl")

_downloadId=$(printf "%s" $_releaseinfo | jq -r ".linux.downloadId")
_pkgver=$(printf "%s" $_releaseinfo | jq -r '[ .linux.major, .linux.minor, .linux.releaseNum ] | join(".")')

if [[ $pkgver != $_pkgver ]];then
    echo "Version mismatch"
    exit
fi

_reqjson="{ \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"country\": \"us\", \
    \"street\": \"Bowery 146\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"product\": \"$_product\" \
}"

_reqjson="$(  printf '%s' "$_reqjson"   | sed 's/[[:space:]]\+/ /g')"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_useragent// /\\ }"

_siteurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadId}"
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
            -H Upgrade-Insecure-Requests:\ 1 \
            -H ${_useragent_escaped} \
            -H Accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8 \
            -H Accept-Language:\ en-US,en;q=0.9 \
            -o %o \
            --compressed \
            %u")

_pkgname=resolve
resolve_app_name=com.blackmagicdesign.resolve
pkgrel=1
arch=('x86_64')
url="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion"
license=('Commercial')
depends=('glu' 'gtk2' 'libpng12' 'fuse2' 'opencl-driver' 'qt5-x11extras' 'qt5-svg' 'qt5-webengine' 'qt5-websockets'
'qt5-quickcontrols2' 'qt5-multimedia' 'libxcrypt-compat' 'xmlsec' 'java-runtime' 'ffmpeg4.4' 'gst-plugins-bad-libs' 'python-numpy' 
'tbb' 'apr-util' 'luajit')
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf' 'jq')
options=('!strip')

_archive=${_archive_name}.zip
_installer_binary=${_archive_name}.run
source=("${_archive}"::"$_srcurl")

prepare()
{
	pushd "${srcdir}"
	chmod u+x "${srcdir}/${_installer_binary}"
	"${srcdir}/${_installer_binary}" --appimage-extract
	popd

	# Fix permission to all files and dirs
	chmod -R u+rwX,go+rX,go-w "${srcdir}/squashfs-root"

	pushd "${srcdir}/squashfs-root/share/panels"
	tar -zxvf dvpanel-framework-linux-x86_64.tgz
	chmod -R u+rwX,go+rX,go-w "${srcdir}/squashfs-root/share/panels/lib"
	mv *.so "${srcdir}/squashfs-root/libs"
	mv lib/* "${srcdir}/squashfs-root/libs"
	popd

	rm -rf "${srcdir}"/squashfs-root/installer "${srcdir}"/squashfs-root/installer* "${srcdir}"/squashfs-root/AppRun "${srcdir}"/squashfs-root/AppRun*

	while IFS= read -r -d '' i; do
		chmod 0755 "${i}"
	done < <(find "${srcdir}/squashfs-root" -type d -print0)

	while IFS= read -r -d '' i; do
		[[ -f "${i}" && $(od -t x1 -N 4 "${i}") == *"7f 45 4c 46"* ]] || continue
		chmod 0755 "${i}"
	done < <(find "${srcdir}/squashfs-root" -type f -print0)

	while IFS= read -r -d '' i; do
		[[ -f "${i}" && $(od -t x1 -N 4 "${i}") == *"7f 45 4c 46"* ]] || continue
		patchelf --set-rpath \
'/opt/'"${_pkgname}"'/libs:'\
'/opt/'"${_pkgname}"'/libs/plugins/sqldrivers:'\
'/opt/'"${_pkgname}"'/libs/plugins/xcbglintegrations:'\
'/opt/'"${_pkgname}"'/libs/plugins/imageformats:'\
'/opt/'"${_pkgname}"'/libs/plugins/platforms:'\
'/opt/'"${_pkgname}"'/libs/Fusion:'\
'/opt/'"${_pkgname}"'/plugins:'\
'/opt/'"${_pkgname}"'/bin:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/BlackmagicRawAPI:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/platforms:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/imageformats:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/mediaservice:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/audio:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/xcbglintegrations:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWSpeedTest/plugins/bearer:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/BlackmagicRawAPI:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/mediaservice:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/imageformats:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/audio:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/platforms:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/xcbglintegrations:'\
'/opt/'"${_pkgname}"'/BlackmagicRAWPlayer/plugins/bearer:'\
'/opt/'"${_pkgname}"'/Onboarding/plugins/xcbglintegrations:'\
'/opt/'"${_pkgname}"'/Onboarding/plugins/qtwebengine:'\
'/opt/'"${_pkgname}"'/Onboarding/plugins/platforms:'\
'/opt/'"${_pkgname}"'/Onboarding/plugins/imageformats:'\
'/opt/'"${_pkgname}"'/DaVinci Control Panels Setup/plugins/platforms:'\
'/opt/'"${_pkgname}"'/DaVinci Control Panels Setup/plugins/imageformats:'\
'/opt/'"${_pkgname}"'/DaVinci Control Panels Setup/plugins/bearer:'\
'/opt/'"${_pkgname}"'/DaVinci Control Panels Setup/AdminUtility/PlugIns/DaVinciKeyboards:'\
'/opt/'"${_pkgname}"'/DaVinci Control Panels Setup/AdminUtility/PlugIns/DaVinciPanels:'\
'$ORIGIN' "${i}"
	done < <(find "${srcdir}/squashfs-root" -type f -size -32M -print0)

	while IFS= read -r -d '' i; do
		sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" "${i}"
	done < <(find . -type f '(' -name "*.desktop" -o -name "*.directory" -o -name "*.directory" -o -name "*.menu" ')' -print0)

	ln -s "${srcdir}/squashfs-root/BlackmagicRAWPlayer/BlackmagicRawAPI" "${srcdir}/squashfs-root/bin/"

	echo "StartupWMClass=resolve" >> "${srcdir}/squashfs-root/share/DaVinciResolve.desktop"

	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "${srcdir}/squashfs-root/share/etc/udev/rules.d/99-DavinciPanel.rules"
}

package()
{
	mkdir -p -m 0755 "${pkgdir}/opt/${_pkgname}/"{configs,DolbyVision,easyDCP,Fairlight,GPUCache,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}

	# Install the squashfs-root
	cp -rf "${srcdir}"/squashfs-root/* "${pkgdir}/opt/${_pkgname}"

	# Distribute files into other directories
	pushd "${pkgdir}/opt/${_pkgname}/"
	install -Dm0644 share/default-config.dat -t "${pkgdir}/opt/${_pkgname}/configs"
	install -Dm0644 share/log-conf.xml -t "${pkgdir}/opt/${_pkgname}/configs"
	install -Dm0644 share/default_cm_config.bin -t "${pkgdir}/opt/${_pkgname}/DolbyVision"

	install -Dm0644 share/DaVinciResolve.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm0644 share/DaVinciControlPanelsSetup.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm0644 share/DaVinciResolveInstaller.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm0644 share/DaVinciResolveCaptureLogs.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm0644 share/blackmagicraw-player.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm0644 share/blackmagicraw-speedtest.desktop -t "${pkgdir}/usr/share/applications"

	install -Dm0644 share/DaVinciResolve.directory -t "${pkgdir}/usr/share/desktop-directories"
	install -Dm0644 share/DaVinciResolve.menu -t "${pkgdir}/etc/xdg/menus"
	install -Dm0644 graphics/DV_Resolve.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
	install -Dm0644 graphics/DV_ResolveProj.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
	install -Dm0644 share/resolve.xml -t "${pkgdir}/usr/share/mime/packages"

	install -Dm0644 share/etc/udev/rules.d/99-BlackmagicDevices.rules -t "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm0644 share/etc/udev/rules.d/99-ResolveKeyboardHID.rules -t "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm0644 share/etc/udev/rules.d/99-DavinciPanel.rules -t "${pkgdir}/usr/lib/udev/rules.d"
	popd
}

# vim: fileencoding=utf-8 sts=4 sw=4 noet
