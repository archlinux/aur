# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.4
# lua-cs-bouncer, the Lua half that upstream's release puts together with the nginx configuration:
# the version its Makefile clones (LUA_BOUNCER_BRANCH), which check() compares
_luaver=1.0.19
pkgrel=1
pkgdesc="CrowdSec bouncer for Nginx"
arch=(any)
url="https://github.com/crowdsecurity/cs-nginx-bouncer"
license=(MIT)
replaces=(cs-nginx-bouncer)
provides=(cs-nginx-bouncer)
conflicts=(cs-nginx-bouncer)
# lua-resty-http as a package rather than the copy upstream's release vendors since 1.2.4
# (vendor/lua-resty-http), which isn't installed
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
# The sources upstream's release puts together (make release), from their tags: its archive's folder
# is named after the newest tag in git's version order, crowdsec-nginx-bouncer-v1.2.4-rc1 for 1.2.4
source=(
  "cs-nginx-bouncer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "lua-cs-bouncer-$_luaver.tar.gz::https://github.com/crowdsecurity/lua-cs-bouncer/archive/refs/tags/v$_luaver.tar.gz"
)
sha512sums=('fc87624bf77a2d8464aec9b99184ea501611394bd1a1426583b9b2ddae3e0606e78dabf5c337941e405474065a17a2bc05ef3254822ca2613b8cdf62c1f0a0e2'
  '0ecc7da6a9d56cfdb336b8ef72d8398f54fb500b95fcc96531a9d6639980b98298bf4732c1a001c796f3dc317316fd1236104d57cad08709d775aac399797643')
b2sums=('5db2e8ed3192a6a3034f9e698c2f3c7bc2bbb2a23856c5ca4235e69fc90a157b08d7fe12e2d0066f9fafcd08987262b8353fc02f8dff40cd15667e23ec405926'
  '103249ad91499730e7432ef988616795bcddc31d015084714acc7104b5e30b807f61b352c047886f978b48485a21ca4334cfba64de5847981bbefe63a607a114')

prepare() {
  sed -i 's@var/lib/crowdsec/lua/templates@etc/nginx/lua/templates/crowdsec@' \
    "lua-cs-bouncer-$_luaver/config_example.conf"
  # $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
  # shellcheck disable=SC2016
  sed -i 's@/usr/local/lua/crowdsec/@$prefix/lua/plugins/crowdsec/@' \
    "cs-nginx-bouncer-$pkgver/nginx/crowdsec_nginx.conf"
}

check() {
  # The lua-cs-bouncer of upstream's release
  grep -qx "LUA_BOUNCER_BRANCH?=v$_luaver" "cs-nginx-bouncer-$pkgver/Makefile" || exit
}

package() {
  install -dm755 "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  install -dm755 "$pkgdir"/etc/nginx/lua/templates/crowdsec/

  install -Dm644 "cs-nginx-bouncer-$pkgver/nginx/crowdsec_nginx.conf" -t "$pkgdir"/etc/nginx/conf.d/
  cd "lua-cs-bouncer-$_luaver" || exit
  cp -R lib/* "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  cp -R templates/* "$pkgdir"/etc/nginx/lua/templates/crowdsec/
  install -Dm600 config_example.conf "$pkgdir"/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
