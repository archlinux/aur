# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=7.50.14
_pkgtyp=stable
pkgrel=3
pkgdesc="Collaboration suite service for office messaging, calendars, meetings, docs..."
arch=('x86_64')
url="https://www.larksuite.com"
_licensever=1.2.1437
license=('LicenseRef-Lark-User-${_licensever}')
depends=('gtk3' 'nspr' 'nss' 'libpulse' 'libmfx' 'alsa-lib')
optdepends=('appmenu-gtk-module: Appmenu support')
makedepends=('curl')
replaces=('bytedance-lark-dev-bin')
provides=('bytedance-lark=$pkgver' 'lark=$pkgver')
options=('!emptydirs')
source=(Lark-linux_x64-${pkgver}.deb::https://www.larksuite.com/api/package_info?platform=10
	LICENSE-${_licensever}.html::http://www.larksuite.com/en_us/user-terms-of-service)
DLAGENTS=("https::/usr/bin/sh -c curl\ -LO\ \"\$\(curl\ \'%u\'\ \|\ grep\ -oP\ \'\(\?\<=\"download_link\":\"\)\[\^\"\]\*\'\ --\ \|\ sed\ \'s/\\\\\\\\u0026/\\\&/g\'\ --\)\""
	"http::/usr/bin/sh -c curl\ -L\ %u\ \|\ sed\ \'s/abUuid\":\"\[\^\"\]\*/abUuid\":\"418/\'\ \|\ sed\ \'s/countryCode\":\"\[\^\"\]\*/countryCode\":\"LI/\'\ \>\ %o")
sha256sums=('708d2a0cd1b431c42d6f2d6dcdd566e62c6218cb88bee3687c02ca2a9855b52d'
            '627d921fcedb770744b2460aaddfc607390b1181ffc793b11597c9f66fd5a07a')

package() {
	# License
	install -Dm644 LICENSE-${_licensever}.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${_licensever}.html"

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
