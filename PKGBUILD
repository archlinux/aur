# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=ps3netsrv
pkgver=20250216
pkgrel=1
pkgdesc='PS3 Net Server (mod by aldostools)'
arch=('x86_64')
url='https://github.com/aldostools/ps3netsrv'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'mbedtls')
makedepends=('meson')
backup=("etc/conf.d/${pkgname}")
source=(
	"https://github.com/aldostools/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.conf"
)
sha512sums=('e63cd58cd282bd422294d1761c76897d63e396ee48dc517792536263bbaa3024c39cfc0cdb9b5bb893ae66717efa21ba2d3e5814c7a8dbd25a5620f1efccbf79'
            'ce955bbaf577963244a6e96a8a8fffe037e5067321bc507fe7f71b12d8e198b5280de708dd9cffbf59d0c9a82e05bf9901dbcc8f8bc0d548b2d2c2ead7e07941'
            'c81e3ef6a4bf07cd150b205793ca5a3886cf9d76c1087cc1d1325ca779628c074cfcbe8349b0bda691f61ab4f394d8594af1ed945c7207acc5712057dc5fbe59')

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
