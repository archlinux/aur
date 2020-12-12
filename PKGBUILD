# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=2.1
pkgrel=5
pkgdesc="GeoIP Database for xtables"
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
         'xt_geoip_build'
         'mmcsv_geoip_build')
sha256sums=('SKIP'
            'bd1dbbacdde0c6b63b15c00a9b3cecada7c95bbd72cd2f7a336106fce53cddbd'
            'd47c67f8126915ef4f326befa3b3b50903e335efdc52967a401e17749b7b92bd'
            'beebf34ac2138e8916eb31450b50d693b174fe2f54626d8a858521b7391cbefc')

package() {
    echo Using ${_dbsource} GeoIP database
    install -d -m 755 "${pkgdir}"/usr/share/xt_geoip
    if [[ -z "${_maxmind_key}" ]]; then
        cd "${srcdir}"
        perl "${srcdir}"/xt_geoip_build -D "${pkgdir}"/usr/share/xt_geoip -i "dbip-country-lite-${_geoip_date}.csv"
    else
        cd "${srcdir}"/GeoLite2-Country-CSV_*
        perl "${srcdir}"/mmcsv_geoip_build -D "${pkgdir}"/usr/share/xt_geoip
    fi
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
    sed -i -e "s/@@@DBSOURCE@@@/${_dbsource}/g" -e "s#@@@DBLINK@@@#${_dblink}#g" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
