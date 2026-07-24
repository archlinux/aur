# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.0
pkgrel=1
pkgdesc="CrowdSec bouncer for Nginx"
arch=('any')
url="https://github.com/crowdsecurity/cs-nginx-bouncer"
license=('MIT')
replaces=('cs-nginx-bouncer')
provides=('cs-nginx-bouncer')
conflicts=('cs-nginx-bouncer')
depends=(
  'crowdsec'
  'lua51-cjson'
  'lua-resty-http'
  'lua-resty-string'
)
optdepends=('luajit-openresty: OpenResty optimised luajit'
  'nginx-mainline-mod-lua: Support for nginx-mainline'
  'nginx-mod-lua: Support for nginx')
makedepends=(
  'gettext'
)
backup=(
  etc/nginx/lua/templates/crowdsec/{ban,captcha}.html
  etc/nginx/conf.d/crowdsec_nginx.conf
  etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf
)
install=cs-nginx-bouncer.install
source=(
  "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}.tgz"
)
sha512sums=('54ff95198ea97ed80874b318a4518868d559269792b1775bce9b95a9c7033670147f0975a96df22456a8cd4fc937bc567e141564bc262658d83d3ee1d810cadc')
b2sums=('87ea5d2de7ed0abaf6625fdcd62357a621ade0f98171181a41969f6f9d78c58dd6aa5762fcc75a951433cb12b93c690fa5180690bb5dee6c699d9c37606b4fd2')

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
