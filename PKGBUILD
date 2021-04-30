# Maintainer:   chn <g897331845@gmail.com>

pkgname=dnsmasq-domainlist-v2ray
pkgver=210430
_commit="a5a42dcac50301cf4f505e0ef7837cf31b2e64df"
pkgrel=1
pkgdesc="dnsmasq domain list converted from v2ray domain-list-community"
url="https://github.com/v2fly/domain-list-community"
arch=('any')
license=('MIT')
depends=('dnsmasq-regex')
makedepends=('gcc' 'fmt')
source=("git+https://github.com/v2fly/domain-list-community.git#commit=$_commit"
    "convert.cpp")
md5sums=('SKIP'
         '33b96dd5dacad8944327069baad629b5')

build() {
  cd "$srcdir"
  g++ convert.cpp -o convert -lfmt -std=c++20 -Wall -Wextra
  chmod +x convert
  ./convert domain-list-community/data geolocation-cn 114.114.114.114 cn.conf 2>&1 > /dev/null
  ./convert domain-list-community/data geolocation-!cn 8.8.8.8 not_cn.conf 2>&1 > /dev/null
}

package() {
  mkdir -p "${pkgdir}/usr/share/dnsmasq-domainlist-v2ray"
  install -m 644 "${srcdir}/cn.conf" "${pkgdir}/usr/share/dnsmasq-domainlist-v2ray"
  install -m 644 "${srcdir}/not_cn.conf" "${pkgdir}/usr/share/dnsmasq-domainlist-v2ray"
}
