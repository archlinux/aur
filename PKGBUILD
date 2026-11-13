# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=3.0
pkgrel=1
pkgdesc="GeoIP Database for xtables"
arch=('any')
license=('CC-BY-4.0' 'CC-BY-SA-4.0')
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
_geoip_date=`date +%Y-%m`

# if you want to use MaxMind GeoLite DB instead of DB-IP then,
# get license key from MaxMind and create a file named
# geoip.license.key containing following:
# _maxmind_id=ACCOUNT_ID_HERE
# _maxmind_key=LICENSE_KEY_HERE

[[ -f geoip.license.key ]] && source geoip.license.key
[ -z "${_maxmind_id}" ] && unset _maxmind_key
if [[ -z "${_maxmind_key}" ]]; then
    url="https://db-ip.com/db/download/ip-to-country-lite"
    source="dbip-country-lite-${_geoip_date}.csv.gz::https://download.db-ip.com/free/dbip-country-lite-${_geoip_date}.csv.gz"
    _dbsource="DB-IP Lite database by DB-IP"
    _dblink="https://db-ip.com"
else
    url="https://www.maxmind.com/en/geolite-free-ip-geolocation-data"
    # WARNING: maxmind id and key will get exposed via ps as well as via .SRCINFO
    source="GeoLite2-Country-CSV-${_geoip_date}.zip::https://${_maxmind_id}:${_maxmind_key}@download.maxmind.com/geoip/databases/GeoLite2-Country-CSV/download?suffix=zip"
    _dbsource="GeoLite Data created by MaxMind"
    _dblink="https://www.maxmind.com"
fi
source+=('README'
         'xt_geoip_build'
         'mmcsv_geoip_build')
sha256sums=('SKIP'
            '20719c2e34c5123765375b9e7c737890c53e71967ab839521989dbb82f775249'
            'ff867e1e2769b61ba9dcc825b73de37a46fe446bb4e3eb528dd7f15e960ce76b'
            '2ff950f3ed0e93722bf0477a4b0bd3fdd79d94b5631f073e80bc76f10d596cc3')

package() {
    cd "${srcdir}"
    echo Using ${_dbsource}
    install -d -m 755 "${pkgdir}"/usr/share/xt_geoip
    if [[ -z "${_maxmind_key}" ]]; then
        perl "${srcdir}"/xt_geoip_build -D "${pkgdir}"/usr/share/xt_geoip -i "dbip-country-lite-${_geoip_date}.csv"
    else
        cd GeoLite2-Country-CSV_*
        perl "${srcdir}"/mmcsv_geoip_build -D "${pkgdir}"/usr/share/xt_geoip
    fi
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
    sed -i -e "s/@@@DBSOURCE@@@/${_dbsource}/g" -e "s#@@@DBLINK@@@#${_dblink}#g" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
