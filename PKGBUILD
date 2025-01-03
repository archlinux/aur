# Maintainer: helllamer <helllamer#gmail.com>

pkgname=sing-box-db-ruleset-ru-antizapret
pkgver=latest
pkgrel=1
pkgdesc="Geosite Database and Rule Sets for sing-box (RUSSIA antizapret)"
arch=(any)
url="https://github.com/savely-krasovsky/antizapret-sing-box"
if [[ "$pkgver" -eq "latest" ]]; then
    _relurl="$url/releases/$pkgver/download"
else
    _relurl="$url/releases/download/$pkgver"
fi
license=(MIT)
makedepends=('curl' 'awk')

source=("${pkgver}-geosite.db::${_relurl}/geosite.db"
        "${pkgver}-geosite.db.sha256sum::${_relurl}/geosite.db.sha256sum"
        "${pkgver}-geoip.db::${_relurl}/geoip.db"
        "${pkgver}-geoip.db.sha256sum::${_relurl}/geoip.db.sha256sum"
        "${pkgver}-antizapret.srs::${_relurl}/antizapret.srs"
        "${pkgver}-antizapret.srs.sha256sum::${_relurl}/antizapret.srs.sha256sum"
        "LICENSE::https://raw.githubusercontent.com/savely-krasovsky/antizapret-sing-box/refs/heads/master/LICENSE")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6160153f24af1710db67447fc3610b56daed3c4e1f4539177e1cb87db00a4499')

pkgver() {
  curl -I "$url/releases/latest" 2>/dev/null | grep -i "location:" | awk -F/ '{print $NF}' | grep -oE '[0-9]+'
}

prepare() {
  #TODO sha256sum -c "${pkgver}-geosite.db.sha256sum"
  mv "${pkgver}-geosite.db" geosite.db
  
  #TODO sha256sum -c "${pkgver}-geoip.db.sha256sum"
  mv "${pkgver}-geoip.db" geoip.db

  #TODO sha256sum -c "${pkgver}-antizapret.srs.sha256sum"
  mv "${pkgver}-antizapret.srs" antizapret.srs
}

package() {
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  
  install -dm755 "$pkgdir/usr/share/sing-box"
  install -Dm644 "geoip.db" "$pkgdir/usr/share/sing-box"
  install -Dm644 "geosite.db" "$pkgdir/usr/share/sing-box"

  install -dm755 "$pkgdir/usr/share/sing-box/rule-set"
  install -Dm644 "antizapret.srs" "$pkgdir/usr/share/sing-box/rule-set"
}
