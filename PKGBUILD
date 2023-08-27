# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-naxsi
pkgver=1.4
_injectionver=3.10.0
pkgrel=1

_modname=naxsi

pkgdesc='Nginx Anti XSS & SQL Injection (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/wargio/naxsi/"
license=('GPL3')
backup=(
	etc/nginx/naxsi/blocking/10000000_scanner.rules
	etc/nginx/naxsi/blocking/20000000_web_security.rules
	etc/nginx/naxsi/blocking/30000000_wordpress.rules
	etc/nginx/naxsi/blocking/40000000_php_security.rules
	etc/nginx/naxsi/blocking/50000000_sql_injection.rules
	etc/nginx/naxsi/naxsi_block_mode.conf
	etc/nginx/naxsi/naxsi_core.rules
	etc/nginx/naxsi/naxsi_denied_url.conf
	etc/nginx/naxsi/naxsi_learning_mode.conf
	etc/nginx/naxsi/whitelists/dokuwiki.rules
	etc/nginx/naxsi/whitelists/drupal.rules
	etc/nginx/naxsi/whitelists/etherpad-lite.rules
	etc/nginx/naxsi/whitelists/generic.rules
	etc/nginx/naxsi/whitelists/iris.rules
	etc/nginx/naxsi/whitelists/rutorrent.rules
	etc/nginx/naxsi/whitelists/wordpress-minimal.rules
	etc/nginx/naxsi/whitelists/wordpress.rules
	etc/nginx/naxsi/whitelists/zerobin.rules
)
source=(https://github.com/wargio/$_modname/archive/$pkgver/$_modname-$pkgver.tar.gz
        https://github.com/libinjection/libinjection/archive/refs/tags/v3.10.0/libinjection-3.10.0.tar.gz)
sha256sums=('2ca068fecbd5e12bac13651d51162675060f3a9c29e1bc8bd29aab417f7d2038'
            '9dd7ae68a21a3c50f705c383b1b714c77fd4093b0a561a5400f0cb0ad79b1ae7')
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
	
	rm -rf "$srcdir"/naxsi-$pkgver/naxsi_src/libinjection
	ln -s ../../libinjection-$_injectionver "$srcdir"/naxsi-$pkgver/naxsi_src/libinjection
}

build() {
	cd build
	/usr/src/nginx/configure \
		--with-compat \
		--add-dynamic-module=../$_modname-$pkgver/naxsi_src
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done

	cd "$srcdir/naxsi-$pkgver"
	install -Dm644 distros/nginx/naxsi_block_mode.conf "$pkgdir"/etc/nginx/naxsi/naxsi_block_mode.conf
	install -Dm644 distros/nginx/naxsi_denied_url.conf "$pkgdir"/etc/nginx/naxsi/naxsi_denied_url.conf
	install -Dm644 distros/nginx/naxsi_learning_mode.conf "$pkgdir"/etc/nginx/naxsi/naxsi_learning_mode.conf
	install -Dm644 naxsi_rules/naxsi_core.rules "$pkgdir"/etc/nginx/naxsi/naxsi_core.rules

	cd naxsi_rules
	for f in {whitelists,blocking}/*.rules; do
		install -Dm644 "$f" "$pkgdir/etc/nginx/naxsi/$f"
	done
}
