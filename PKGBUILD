# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.3
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
  'gettext' # envsubst in the install script
  'lua51-cjson'
  'lua-resty-http'
  'lua-resty-string'
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
sha512sums=('9b2672e88fdfff63fc6f50051c0260ceebe2b2bf05d7bb471102fc48bc14e5f18ce9ce73626d3a14b600c88c13da43401f98e104feb31a5390deb24c0daae022')
b2sums=('610007c64fc4c6d9d068f45fb29e11c77ed285e8db95bb5a808589ab87bfcfa1138155705a99949d4fbd8479c62a92d17fc04410b13d64ee81c645ac0e37fad3')

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
