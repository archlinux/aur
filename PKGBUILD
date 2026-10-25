# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=ps3netsrv
pkgver=20260913
pkgrel=2
pkgdesc='PS3 Net Server (mod by aldostools)'
arch=('x86_64')
url='https://github.com/aldostools/ps3netsrv'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'mbedtls3')
makedepends=('meson')
backup=("etc/conf.d/${pkgname}")
source=(
	"https://github.com/aldostools/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.conf"
	'ps3netsrv-mbedtls3.diff'
)
sha512sums=('63d0ef7749bdaf9a6ef79e17be215a57b6972c63c0482bb9ce298f01139408c7da5212225d152b3f28420fac0a0a3fba0a9caadfe0532dc820fe54d00b1dca5f'
            'ce955bbaf577963244a6e96a8a8fffe037e5067321bc507fe7f71b12d8e198b5280de708dd9cffbf59d0c9a82e05bf9901dbcc8f8bc0d548b2d2c2ead7e07941'
            'c81e3ef6a4bf07cd150b205793ca5a3886cf9d76c1087cc1d1325ca779628c074cfcbe8349b0bda691f61ab4f394d8594af1ed945c7207acc5712057dc5fbe59'
            '90eb9de06f389914558c662ee265c9daf69f4d418cec0c4742b50ab078ea8165b4dcf57010994bb0000db2107be96a92544bad7b4f3f8ae98aa7b8eea5b3c598')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i ../ps3netsrv-mbedtls3.diff
}
build() {
	cd "${pkgname}-${pkgver}"
	meson --prefix /usr --buildtype=plain build
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.conf" "$pkgdir/etc/conf.d/${pkgname}"
	install -Dm644 'LICENSE.TXT' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.TXT"

echo 'u! ps3netsrv - "PS3 Net Server daemon"' |
	install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
