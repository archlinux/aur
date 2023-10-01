# Maintainer: FirstAirBender <noblechuk5 at web dot de>
pkgname=cs-nginx-bouncer
_pkgname=crowdsec-nginx-bouncer
pkgver=1.0.5
pkgrel=5
pkgdesc="CrowdSec bouncer for Nginx"
arch=('any')
url="https://doc.crowdsec.net/docs/bouncers/nginx"
_giturl="https://github.com/crowdsecurity/${pkgname}"
license=('MIT')
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
	"$_pkgname-$pkgver.tar.gz::${_giturl}/releases/download/v${pkgver}/${_pkgname}.tgz"
	"cs-nginx-bouncer.install"
)
sha256sums=('2bb65903558598fc72c20de512267cbf0759d79f0e038c5a3b8ecf2626470d3f'
            '40b787d90acc63c8c1d30895a1505c4c235cd5ff8d889bffd3bb71d6da0ba88a')

prepare() {
	cd "$_pkgname-v$pkgver"
	sed -i s:var/lib/crowdsec/lua/templates:etc/nginx/lua/templates/crowdsec: lua-mod/config_example.conf
	# $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
	sed -i s:/usr/local/lua/crowdsec/:'$prefix/lua/plugins/crowdsec/': nginx/crowdsec_nginx.conf
}

package() {
	cd "$_pkgname-v$pkgver"
	install -dm755 $pkgdir/etc/nginx/lua/plugins/crowdsec/
	install -dm755 $pkgdir/etc/nginx/lua/templates/crowdsec/

	install -Dm644 {nginx,$pkgdir/etc/nginx/conf.d}/crowdsec_nginx.conf
	cp -R lua-mod/lib/* $pkgdir/etc/nginx/lua/plugins/crowdsec/
	cp -R lua-mod/templates/* $pkgdir/etc/nginx/lua/templates/crowdsec/
	install -Dm600 lua-mod/config_example.conf $pkgdir/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf
}
