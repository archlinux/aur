# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=8.0.18
_pkgtyp=stable
pkgrel=1
pkgdesc="Collaboration suite service for office messaging, calendars, meetings, docs..."
arch=('x86_64')
url="https://www.larksuite.com"
_licensever=20260122
_licensever_us=20260122
license=('LicenseRef-Lark-User')
depends=('gtk3' 'nspr' 'nss' 'libpulse' 'libmfx' 'alsa-lib')
optdepends=('appmenu-gtk-module: Appmenu support')
makedepends=('curl' 'jq')
replaces=('bytedance-lark-dev-bin')
provides=("bytedance-lark=$pkgver" "lark=$pkgver")
options=('!emptydirs')
source=("Lark-linux_x64-${pkgver}.deb::lark+https://www.larksuite.com/api/package_info?platform=10"
	"LICENSE-${_licensever}.html::https://www.larksuite.com/en_us/user-terms-of-service"
	"LICENSE-US-${_licensever_us}.html::https://www.larksuite.com/en_us/user-terms-of-service-us"
	download-lark.sh
)
b2sums=('63101353a73cc9da6af300fbb0e7644bdb69551b7f9831f42e89e4d453e2352c7133e6ed2ec906eab3cce81cc24e54530b6fa8bb2ecc243c53a4c330f5fa494b'
        'SKIP'
        'SKIP'
        '22556020116e1c7df34ee12c29e60495489b5199cfb5bfc87f028b540d44ee4f10fd67495062985521bfb4b9b342de58339aeae5ddbd689640881e47ea5ee0c5')
DLAGENTS+=("lark::${startdir}/download-lark.sh %o %u")

package() {
	# License
	install -Dm644 LICENSE-${_licensever}.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${_licensever}.html"
	install -Dm644 LICENSE-US-${_licensever_us}.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-US-${_licensever_us}.html"

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
