# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=7.62.9
_pkgtyp=stable
pkgrel=3
pkgdesc="Collaboration suite service for office messaging, calendars, meetings, docs..."
arch=('x86_64')
url="https://www.larksuite.com"
_licensever=20260122
license=('LicenseRef-Lark-User-${_licensever}')
depends=('gtk3' 'nspr' 'nss' 'libpulse' 'libmfx' 'alsa-lib')
optdepends=('appmenu-gtk-module: Appmenu support')
makedepends=('curl')
replaces=('bytedance-lark-dev-bin')
provides=('bytedance-lark=$pkgver' 'lark=$pkgver')
options=('!emptydirs')
source=(Lark-linux_x64-${pkgver}.deb::https://www.larksuite.com/api/package_info?platform=10
	LICENSE-${_licensever}.html::http://www.larksuite.com/en_us/user-terms-of-service
	LICENSE-US-${_licensever}.html::http://www.larksuite.com/en_us/user-terms-of-service-us
	dlagent-lark.sh
	dlagent-license.sh
	dlagent-license-global.sh
	dlagent-license-US.sh)
DLAGENTS=("https::/usr/bin/sh ${startdir}/dlagent-lark.sh %o %u"
	"http::/usr/bin/sh ${startdir}/dlagent-license.sh %o %u")
sha256sums=('d6662c8fb30624c337f154244f7dd959ca6d70a899d5f22685f838b30785481a'
            '9adb1906622edc9eb5fd4e75847c3367102cdbca974c88831e5b3347fcad45f8'
            'b9affd4412225905a79b64662acb48e32f007b197ac74dbbf0ad37820a6179e9'
            '742edd7ea5dc81caefd79d78f137ed91e83b3ab780fe1451600048a3fc2faa59'
            '3118084bc1714421df79d564ebebf27173e3629a0ee45529ea7a854eda7b9dea'
            '43768fe6801ca4f04ad83978efb9ff00681f70fd0e74f5856eb081f4b114543a'
            '5667985d6e882c8565d3b76a93172e504a92dde5c8f889ecfaf40a7bda97d02b')

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
