# Maintainer: Gzxhwq <gzxhwq@gmail.com>
pkgname=v2ray-rules-dat-autoupdate
_pkgname=v2ray-rules-dat
pkgdesc="Enhanced edition of V2Ray and Xray rules dat files, compatible with Trojan-Go. Automaitcally update."
pkgver=1.0
pkgrel=1
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
#tag=$(git ls-remote --tags --refs --sort="version:refname" "$url".git | awk -F/ 'END{print$NF}')
license=('GPL')

provides=('xray-domain-list-community' 'xray-geoip' 'v2ray-domain-list-community' 'v2ray-geoip' 'v2ray-domain-list-custom' 'v2ray-geoip-custom' 'v2ray-rules-dat-git' 'vxray-rules-dat-git')
conflicts=('xray-domain-list-community' 'xray-geoip' 'v2ray-domain-list-community' 'v2ray-geoip' 'v2ray-domain-list-custom' 'v2ray-geoip-custom' 'v2ray-rules-dat-git' 'vxray-rules-dat-git')

makedepends=('git')
depends=('curl')

install="${pkgname}.install"

source=("${url}/releases/latest/download/rules.zip"
        "${pkgname}"
        "${pkgname}.install"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.service"
        "${pkgname}.timer")
  
sha256sums=($(curl -sL ${url}/releases/latest/download/rules.zip.sha256sum | awk '{print $1}')
            '1fd7c4f89bb0b89520b1615a5d6e1372a90a3b13ecb1c6669825c44cc52169b4'
            'd5deeb9e02b2cf6e233da4369bb7d74e06054bd54ee9e62875f3342d7c931dbd'
            '5d0fac85c93516f45281f3e45071f4f98c4a9eadfbd72602129c888c823b79ef'
            'ea8090be783d0d60f441d25ddad9686b75e5b8405311cc21d29235e80b1671b7'
            '639f27779662970c2d476c4e9af73d7f7f34c1ec5241f43ce95e3231e9a58ea8'
            '5bd55042d53d3794f27483277056f06f5e55d0e7702b0093ec6f17d7da6d548c')

#pkgver() {
#  printf "1.0.r$tag"
#}

package() {

#  sha256sum --check --quiet "./rules.zip.sha256sum"

  install -Dm644 "./geoip.dat" "${pkgdir}/var/lib/${_pkgname}/geoip.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/var/lib/${_pkgname}/geosite.dat"

  mkdir -p "${pkgdir}/usr/share/"
  ln -sf "/var/lib/${_pkgname}" "${pkgdir}/usr/share/v2ray"
  ln -sf "/var/lib/${_pkgname}" "${pkgdir}/usr/share/xray"

  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "./${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "./${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "./${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "./${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
}
