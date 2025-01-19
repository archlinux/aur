# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>

pkgname=netmount
pkgver=1.1.2
pkgrel=1
pkgdesc="Unified management and mounting of cloud storage facilities"
arch=('x86_64' 'aarch64')
url="https://github.com/VirtualHotBar/NetMount"
license=('AGPL-3.0-or-later')
depends=('atk'
         'cairo'
         'glib2'
         'gtk3'
         'libsoup'
         'openssl'
         'pango'
         'webkit2gtk'
         'zstd'
         'zlib-ng')
makedepends=('moreutils'
             'pnpm'
             'rust'
             'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	    "${pkgname}.desktop")
sha512sums=('18afac55e22da152bbb0e70b34f1d8ad32b7030547772f125f4628af07d242db92b0cf7547fb1e4fcbfeb95b17368395ab986ad9f17a501348a0981a2b85074a'
            '84b20dc4ce7d56889f899fdc0966159c2eac6f6e322476e86c046f0df1c245c33d48c0238e6aaad3ac50cd0c08d11f094c5232a51c11ad42e694f9f86bb59179')
options=(!lto)
prepare() {
	cd $srcdir/NetMount-${pkgver}
	cd src-tauri
	jq '.bundle.active = false' tauri.conf.json | sponge tauri.conf.json
}

build() {
	cd $srcdir/NetMount-${pkgver}
	pnpm install
	pnpm tauri-build
}

package() {
	cd $srcdir/NetMount-${pkgver}
	install -Dm755 src-tauri/target/release/${pkgname} -t ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/lib/${pkgname}/res
	cp -r src-tauri/target/release/res ${pkgdir}/usr/lib/${pkgname}
	install -Dm644 public/img/color.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}
