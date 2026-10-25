# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=ps3netsrv
pkgver=20260913
pkgrel=1
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
            '8d31abb9e27455e3d60d652f187b6e5085eed319f1bcb5a8a2e7e70ebfbcf165d5c71a71074af10165390266f6ba8e10d62fcde429a4e1da30ef474612bd3ad7')

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
