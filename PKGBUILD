# Maintainer: FirstAirBender <noblechuk5 at web dot de>
pkgname=crowdsec-nginx-bouncer
pkgver=1.1.3
pkgrel=2
pkgdesc="CrowdSec bouncer for Nginx"
arch=('any')
url="https://doc.crowdsec.net/docs/bouncers/nginx"
_giturl="https://github.com/crowdsecurity/cs-nginx-bouncer"
license=('MIT')
replaces=('cs-nginx-bouncer')
provides=('cs-nginx-bouncer')
conflicts=('cs-nginx-bouncer')
depends=(
  'crowdsec'
  'nginx-mainline-mod-lua'
  'luajit-openresty'
  'lua51'
  'luarocks'
)
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
  "$pkgname-$pkgver.tar.gz::${_giturl}/releases/download/v${pkgver}/${pkgname}.tgz"
  "cs-nginx-bouncer-nginx-module.conf"
)
sha256sums=('8d3b3f1911ead5ca5f309fc57621fee32a613b6af99faa77aa3ed07f780990b9'
            '48b8356f3652ae766496a28714a661c30c9616c12b9cb39ff75dfa78f4677f99')

prepare() {
  cd "$pkgname-v$pkgver-rc4"
  sed -i s:var/lib/crowdsec/lua/templates:etc/nginx/lua/templates/crowdsec: lua-mod/config_example.conf
  # $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
  sed -i s:/usr/local/lua/crowdsec/:'$prefix/lua/plugins/crowdsec/': nginx/crowdsec_nginx.conf
}

package() {
  cd "$pkgname-v$pkgver-rc4"
  install -dm755 $pkgdir/etc/nginx/lua/plugins/crowdsec/
  install -dm755 $pkgdir/etc/nginx/lua/templates/crowdsec/

  install -Dm644 {nginx,$pkgdir/etc/nginx/conf.d}/crowdsec_nginx.conf
  install -Dm644 $srcdir/cs-nginx-bouncer-nginx-module.conf -t $pkgdir/etc/nginx/modules
  cp -R lua-mod/lib/* $pkgdir/etc/nginx/lua/plugins/crowdsec/
  cp -R lua-mod/templates/* $pkgdir/etc/nginx/lua/templates/crowdsec/
  install -Dm600 lua-mod/config_example.conf $pkgdir/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf
}
