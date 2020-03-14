# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=2.0
pkgrel=1
pkgdesc="GeoIP Database for xtables"
arch=('any')
license=('BSD' 'GPL')
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
_xtver=3.9
_dbip_date=`date +%Y-%m`

# if you want to use MaxMind DB instead of DB-IP then,
# create a file named geoip.license.key which contains MaxMind License key in following format:
#_maxmind_key=XXXX
source geoip.license.key

if [[ -z "${_maxmind_key}" ]]; then
    url="https://db-ip.com/db/download/ip-to-country-lite"
    source="dbip-country-lite.csv.gz::https://download.db-ip.com/free/dbip-country-lite-${_dbip_date}.csv.gz"
    _dbsource="DB-IP"
else
    url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
    source="GeoLite2-Country-CSV.zip::https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&suffix=zip&license_key=${_maxmind_key}"
    _dbsource="MaxMind GeoLite2"
fi
source+=("xt_geoip_build::https://sourceforge.net/p/xtables-addons/xtables-addons/ci/v${_xtver}/tree/geoip/xt_geoip_build?format=raw"
        "mmcsv_geoip_build")
sha256sums=('SKIP'
            '6bd72c83973a104481c1bdfb634916ca1c446924d1307e69088702dfe77b7dcf'
            '216cb5a8c018c9db1cbff6b8a788d71d08f1d23dbb4ae60d318fc62fab1a2b46')

package() {
    echo Using ${_dbsource} GeoIP database
    install -d -m 755 "${pkgdir}"/usr/share/xt_geoip
    if [[ -z "${_maxmind_key}" ]]; then
        cd "${srcdir}"
        perl "${srcdir}"/xt_geoip_build -D "${pkgdir}"/usr/share/xt_geoip
    else
        cd "${srcdir}"/GeoLite2-Country-CSV_*
        perl "${srcdir}"/mmcsv_geoip_build -D "${pkgdir}"/usr/share/xt_geoip
    fi
}
