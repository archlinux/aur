# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=7.66.10
_pkgtyp=stable
pkgrel=1
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
	dlagent-license-US.sh
)
DLAGENTS=("https::/usr/bin/sh ${startdir}/dlagent-lark.sh %o %u"
	"http::/usr/bin/sh ${startdir}/dlagent-license.sh %o %u"
)
b2sums=('620178428398e7d967d8e1b34e4e1de5947a62e69c45c22c5f5f111451c40c1b068bb36f42d5d11f80c5af630c3d18d1395bed38ec08be9d5731f1b649dbb070'
        'c3501dceef7f7ce21515d59560a245c8c2812af15ee076bc0610a1424e2e87c3a2be6568e85e4bf2aa5184e704ff37ad5bf67b4fdb79a1550179b45444132ef3'
        'a447d907e149618e3ac34361b0f0a10b56a28a0be6ec0a143dfc1697404c7049a3afae7ffd62466b4acfd28753f96a2869f3ab06e31620c570b9ff4fd8b74b5b'
        '0fe599804f2812e4ba13967d449fa5b41f4dd1949e91ac3c59c3bf95da93c1bf4099ea5088a9877e1b97f8a222e4e6189d965b65a4d2ed1d70736052942257f3'
        'a9a0df1536abd656d64691c1ff82c531e246f327ed06e32607cb3f06dde0bf418aceeec9b1080ac25b012b8efdc14732ae0a1e1ef7d3f78fa3c81e86a4105b3c'
        '8a6ddf4bccf0cc469af51c5ca68c3b27329b5506606f05a955b86c5c69e2e7f132b0e4f7748656038c13af4e7c074bf142e72715f713591e32bc05980bbb4358'
        'e5cb99f2a2440b5c2c8a64e45a8bba379db675270bdef72788ea0e0aa9122c867b2438710ba5c6b117a122305f4a6e22c4e70e136df764c6d0a71ebf17496d78')

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
