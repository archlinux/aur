# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=7.72.23
_pkgtyp=stable
pkgrel=1
pkgdesc="Collaboration suite service for office messaging, calendars, meetings, docs..."
arch=('x86_64')
url="https://www.larksuite.com"
_licensever=20260122
license=("LicenseRef-Lark-User-${_licensever}")
depends=('gtk3' 'nspr' 'nss' 'libpulse' 'libmfx' 'alsa-lib')
optdepends=('appmenu-gtk-module: Appmenu support')
makedepends=('curl' 'jq')
replaces=('bytedance-lark-dev-bin')
provides=("bytedance-lark=$pkgver" "lark=$pkgver")
options=('!emptydirs')
_deb_b2sum='90845fbc95511d3661d4970be9f38202f18b96a537bc81f9db8a6e306e136bebdcf42396fc75a8ce587df2e4227cbee6ad183576e17ce0c6070b656be9b30b25'
source=("LICENSE-${_licensever}.html::https://www.larksuite.com/en_us/user-terms-of-service"
	"LICENSE-US-${_licensever}.html::https://www.larksuite.com/en_us/user-terms-of-service-us"
)
b2sums=('SKIP'
        'SKIP')

prepare() {
	cd "${srcdir}"
	local package_info download_link
	# The signed link expires, so fetch it anew for every build.
	package_info=$(curl -fsSL 'https://www.larksuite.com/api/package_info?platform=10') || return 1
	download_link=$(jq -er --arg version "Linux-x64-deb@V${pkgver}" \
		'.data | select(.version_number == $version) | .download_link' \
		<<< "${package_info}") || return 1
	[[ ${download_link%%\?*} == https://*.larksuitecdn.com/*/Lark-linux_x64-${pkgver}.deb ]] || return 1
	curl -fL --retry 2 -o "Lark-linux_x64-${pkgver}.deb" "${download_link}" || return 1
	printf '%s  %s\n' "${_deb_b2sum}" "Lark-linux_x64-${pkgver}.deb" | b2sum --check || return 1
	bsdtar -xf "Lark-linux_x64-${pkgver}.deb" data.tar.xz
}

package() {
	# License
	install -Dm644 LICENSE-${_licensever}.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${_licensever}.html"
	install -Dm644 LICENSE-US-${_licensever}.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-US-${_licensever}.html"

	# Extract package data
	tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

	# Modify files
	cd "${pkgdir}"

	sed -i 's/StartupNotify=true/StartupNotify=true\nStartupWMClass=lark/g' "${pkgdir}/usr/share/applications/bytedance-lark.desktop"

	sed -i "s/bytedance-lark-${_pkgtyp}/lark/g" "${pkgdir}/usr/share/applications/bytedance-lark.desktop"
	sed -i "s/bytedance-lark-${_pkgtyp}/lark/g" "${pkgdir}/usr/share/menu/bytedance-lark.menu"
	sed -i "s/bytedance-lark/lark/g" "${pkgdir}/usr/share/menu/bytedance-lark.menu"
	sed -i 's/bytedance-lark/lark/g' "${pkgdir}/usr/share/appdata/bytedance-lark.appdata.xml"
	sed -i 's/bytedance-lark/lark/g' "${pkgdir}/opt/bytedance/lark/bytedance-lark"

	mv usr/share/menu/{bytedance-,}lark.menu
	mv usr/share/applications/{bytedance-,}lark.desktop
	mv usr/share/appdata/{bytedance-,}lark.appdata.xml
	mv usr/share/man/man1/{bytedance-lark-${_pkgtyp},lark}.1.gz
	mv usr/share/doc/{bytedance-lark-${_pkgtyp},lark}

	## Move non-standard /opt files to /usr/lib
	install -d "usr/lib/lark/" && mv -T "opt/bytedance/lark" "usr/lib/lark"

	### Update /usr/bin to point there
	rm "usr/bin/bytedance-lark-${_pkgtyp}"
	ln -s '/usr/lib/lark/bytedance-lark' "usr/bin/lark"

	# Icons
	for size in 16 24 32 48 64 128 256; do
		install -d "usr/share/icons/hicolor/${size}x${size}/apps/"
		ln -s "/usr/lib/lark/product_logo_${size}.png" "usr/share/icons/hicolor/${size}x${size}/apps/bytedance-lark.png"
	done

	# Fix directory permissions
	find "${pkgdir}" -type d -exec chmod 755 {} +
}
