# Maintainer: Amish <contact at via dot aur>
pkgname=nftables-geoip-db
pkgver=3.0
pkgrel=1
pkgdesc="GeoIP Database for nftables"
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
         'nft_geoip_build'
         'mmcsv_geoip_build')
sha256sums=('SKIP'
            'a9cb69e33c9560dc89a77e4774adb1b233c0ed3d5415b7f0a7ea09d671cdf5fa'
            'a97daddb428df9d0f4951d335cd36482bfd2f4710338aff87edc4c70cfcfc807'
            'e912ff7d36c70c6bbcf87f9656535a2f470cf5a0f72912671d3a57246784f343')
install=nft_geoip.install

package() {
    cd "${srcdir}"
    echo Using ${_dbsource}
    install -d -m 755 "${pkgdir}"/{etc/nftables.d/geoip,usr/share/nft_geoip}
    if [[ -z "${_maxmind_key}" ]]; then
        perl "${srcdir}"/nft_geoip_build -D "${pkgdir}"/usr/share/nft_geoip -i "dbip-country-lite-${_geoip_date}.csv"
    else
        cd GeoLite2-Country-CSV_*
        perl "${srcdir}"/mmcsv_geoip_build -D "${pkgdir}"/usr/share/nft_geoip
    fi
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}"/README
    sed -i -e "s/@@@DBSOURCE@@@/${_dbsource}/g" -e "s#@@@DBLINK@@@#${_dblink}#g" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
