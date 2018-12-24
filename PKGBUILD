# Maintainer: Amish <contact at via dot aur>
pkgname=nftables-geoip-db
pkgver=1.1
pkgrel=1
pkgdesc="GeoIP Database for nftables"
arch=('any')
license=('BSD' 'GPL')
url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
_xtver=3.2
source=("http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip"
        "xt_geoip_build::https://sourceforge.net/p/xtables-addons/xtables-addons/ci/v${_xtver}/tree/geoip/xt_geoip_build?format=raw"
        "xt_geoip_build.patch"
        "README")
sha256sums=('SKIP'
            '216cb5a8c018c9db1cbff6b8a788d71d08f1d23dbb4ae60d318fc62fab1a2b46'
            '4f9180c17ea45c53da3f4804e98750a7f610510326bd78fd7e52e1f453aeda38'
            '8481a093eb50f73e488668e652eaf0f4a8e2073362565a784d901fb632d0d83a')
install=nft_geoip.install

prepare() {
    cd "${srcdir}"
    cp xt_geoip_build nft_geoip_build
    patch nft_geoip_build xt_geoip_build.patch
}

package() {
    cd "${srcdir}"/GeoLite2-Country-CSV_*
    install -d -m 755 "${pkgdir}"/etc/nftables.d/geoip
    install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}" "${pkgdir}"/usr/share/nft_geoip
    perl "${srcdir}"/nft_geoip_build -D "${pkgdir}"/usr/share/nft_geoip
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
}
