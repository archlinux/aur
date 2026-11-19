# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.4
pkgrel=1
pkgdesc="CrowdSec bouncer for Nginx"
arch=(any)
url="https://github.com/crowdsecurity/cs-nginx-bouncer"
license=(MIT)
replaces=(cs-nginx-bouncer)
provides=(cs-nginx-bouncer)
conflicts=(cs-nginx-bouncer)
depends=(
  crowdsec
  gettext # envsubst in the install script
  lua51-cjson
  lua-resty-http
  lua-resty-string
)
optdepends=('luajit-openresty: OpenResty optimised luajit'
  'nginx-mainline-mod-lua: Support for nginx-mainline'
  'nginx-mod-lua: Support for nginx')
backup=(
  etc/nginx/lua/templates/crowdsec/{ban,captcha}.html
  etc/nginx/conf.d/crowdsec_nginx.conf
  etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf
)
install=cs-nginx-bouncer.install
source=(
  "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}.tgz"
)
sha512sums=('3efbeeab98c5a0b8127c0b4b0e3200f568cf415d4044b88b7b6eb66ba962200448efabea23819f4b55b6e482ad059e5876a1d7740e2b7448c8f3e54b3f2798f2')
b2sums=('c5d4814d831328d2caa313d2aeb4c3ea87b76395deab0594bcc45e7f2030d5a7d40cbe383c063b6bb8bbc0c71fadb54e8f8b59d4b63d186eef5fd3f1ce533b4c')

prepare() {
  cd "$pkgname-v$pkgver" || exit
  sed -i 's@var/lib/crowdsec/lua/templates@etc/nginx/lua/templates/crowdsec@' lua-mod/config_example.conf
  # $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
  # shellcheck disable=SC2016
  sed -i 's@/usr/local/lua/crowdsec/@$prefix/lua/plugins/crowdsec/@' nginx/crowdsec_nginx.conf
}

package() {
  cd "$pkgname-v$pkgver" || exit
  install -dm755 "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  install -dm755 "$pkgdir"/etc/nginx/lua/templates/crowdsec/

  install -Dm644 {nginx,"$pkgdir"/etc/nginx/conf.d}/crowdsec_nginx.conf
  cp -R lua-mod/lib/* "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  cp -R lua-mod/templates/* "$pkgdir"/etc/nginx/lua/templates/crowdsec/
  install -Dm600 lua-mod/config_example.conf "$pkgdir"/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf

  install -Dm644 lua-mod/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
