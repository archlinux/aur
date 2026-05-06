# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: FirstAirBender <noblechuk5 at web dot de>
pkgname=crowdsec-nginx-bouncer
pkgver=1.1.6
pkgrel=1
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
  "$pkgname-$pkgver.tar.gz::${_giturl}/releases/download/v${pkgver}/${pkgname}.tgz"
)
sha256sums=('323c6bd182cda2221d5b2d3d21b7e5e0b66ec77dd306a37299916617c3d50eea')

prepare() {
  cd "$pkgname-v$pkgver"
  sed -i s:var/lib/crowdsec/lua/templates:etc/nginx/lua/templates/crowdsec: lua-mod/config_example.conf
  # $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
  sed -i s:/usr/local/lua/crowdsec/:'$prefix/lua/plugins/crowdsec/': nginx/crowdsec_nginx.conf
}

package() {
  cd "$pkgname-v$pkgver"
  install -dm755 $pkgdir/etc/nginx/lua/plugins/crowdsec/
  install -dm755 $pkgdir/etc/nginx/lua/templates/crowdsec/

  install -Dm644 {nginx,$pkgdir/etc/nginx/conf.d}/crowdsec_nginx.conf
  cp -R lua-mod/lib/* $pkgdir/etc/nginx/lua/plugins/crowdsec/
  cp -R lua-mod/templates/* $pkgdir/etc/nginx/lua/templates/crowdsec/
  install -Dm600 lua-mod/config_example.conf $pkgdir/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf

  install -Dm644 lua-mod/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
