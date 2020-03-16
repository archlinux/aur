# Maintainer: Amish <contact at via dot aur>
pkgname=nftables-geoip-db
pkgver=2.0
pkgrel=3
pkgdesc="GeoIP Database for nftables"
arch=('any')
license=('BSD' 'GPL')
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
_xtver=3.9
_geoip_date=`date +%Y-%m`

# if you want to use MaxMind DB instead of DB-IP then, get license key from
# https://www.maxmind.com/en/geolite2/signup
# create a file named geoip.license.key which contains MaxMind License key in following format:
# _maxmind_key=XXXX

source geoip.license.key
if [[ -z "${_maxmind_key}" ]]; then
    url="https://db-ip.com/db/download/ip-to-country-lite"
    source="dbip-country-lite-${_geoip_date}.csv.gz::https://download.db-ip.com/free/dbip-country-lite-${_geoip_date}.csv.gz"
    _dbsource="DB-IP"
    _dblink="https://db-ip.com"
else
    url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
    source="GeoLite2-Country-CSV-${_geoip_date}.zip::https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&suffix=zip&license_key=${_maxmind_key}"
    _dbsource="MaxMind GeoLite2"
    _dblink="https://www.maxmind.com"
fi
source+=("xt_geoip_build-${_xtver}::https://sourceforge.net/p/xtables-addons/xtables-addons/ci/v${_xtver}/tree/geoip/xt_geoip_build?format=raw"
        "xt_geoip_build.patch"
        "README"
        "mmcsv_geoip_build")
sha256sums=('SKIP'
            '6bd72c83973a104481c1bdfb634916ca1c446924d1307e69088702dfe77b7dcf'
            '6921a708dd944c63b1944695cacc485d60129bf0f0a7f8b61b27a7bced0ba6d4'
            'a1b0557804eec614e6783103754c718b471a8efc116cb9ad67cd23d2dac99f41'
            'cb32484f8030a4eab7fd0b5ffc028a31e46c1b3ec49d818a09e2cbf473f39f17')
install=nft_geoip.install

prepare() {
    cd "${srcdir}"
    if [[ -z "${_maxmind_key}" ]]; then
        ln -s dbip-country-lite-${_geoip_date}.csv dbip-country-lite.csv
        cp xt_geoip_build-${_xtver} nft_geoip_build
        patch nft_geoip_build xt_geoip_build.patch
    else
        cp mmcsv_geoip_build nft_geoip_build
    fi
    echo Using ${_dbsource} GeoIP database
}

package() {
    if [[ -z "${_maxmind_key}" ]]; then
        cd "${srcdir}"
    else
        cd "${srcdir}"/GeoLite2-Country-CSV_*
    fi
    install -d -m 755 "${pkgdir}"/etc/nftables.d/geoip
    install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}" "${pkgdir}"/usr/share/nft_geoip
    perl "${srcdir}"/nft_geoip_build -D "${pkgdir}"/usr/share/nft_geoip
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
    sed -i -e "s/@@@DBSOURCE@@@/${_dbsource}/g" -e "s#@@@DBLINK@@@#${_dblink}#g" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
