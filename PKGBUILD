# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.2
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
sha512sums=('f6f9d1a771bb47d33efcea73dde78b937f403031e963bbfdd13e2a59b8b13756da462d08635a0fd5c039530bc16812a400171954dc0f8b5b24e4f76d07f3e2d3')
b2sums=('b3d63660ecf9281f5a5d8f29a9edda4cd02cd8fcae7002eccac1498b9b4ffc9b770a6c7d6eb8804ad6d6d61839190badba1ba8d8ab104c99d3e166ffb2b49ff3')

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
