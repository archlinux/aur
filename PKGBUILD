# Maintainer: Amish <contact at via dot aur>
pkgname=nftables-geoip-db
pkgver=2.1
pkgrel=5
pkgdesc="GeoIP Database for nftables"
arch=('any')
license=('BSD' 'GPL')
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
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
source+=('README'
         'nft_geoip_build'
         'mmcsv_geoip_build')
sha256sums=('SKIP'
            'a1b0557804eec614e6783103754c718b471a8efc116cb9ad67cd23d2dac99f41'
            '68c5f6918d3e6aa34dbb5ce1284807e178701bcdb7163fccabbaa9329be3be9b'
            '24cecca52e152aab387bcdd0a14a27d1f8f18e19dfc9092f4856043b3347d990')
install=nft_geoip.install

package() {
    echo Using ${_dbsource} GeoIP database
    install -d -m 755 "${pkgdir}"/{etc/nftables.d/geoip,usr/share/nft_geoip}
    if [[ -z "${_maxmind_key}" ]]; then
        cd "${srcdir}"
        perl "${srcdir}"/nft_geoip_build -D "${pkgdir}"/usr/share/nft_geoip -i "dbip-country-lite-${_geoip_date}.csv"
    else
        cd "${srcdir}"/GeoLite2-Country-CSV_*
        perl "${srcdir}"/mmcsv_geoip_build -D "${pkgdir}"/usr/share/nft_geoip
    fi
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
    sed -i -e "s/@@@DBSOURCE@@@/${_dbsource}/g" -e "s#@@@DBLINK@@@#${_dblink}#g" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
