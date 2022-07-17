# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='nginx-mainline-mod-http-xslt-filter'
pkgver=1.21.6
pkgrel=1
pkgdesc='Transform nginx XML responses using XSLT stylesheets'
arch=('x86_64')
url='https://nginx.org/en/docs/http/ngx_http_xslt_module.html'
license=('custom:BSD-2-Clause')
depends=('nginx-mainline' 'libxslt')
makedepends=("nginx-mainline-src=$pkgver")

prepare() {
	cp -r /usr/src/nginx/ ./
}

build() {
	cd 'nginx'
	_options=$(nginx -V |&
	           sed -nE 's/^configure arguments: ([^\n]*)$/\1/p' |
	           sed -nE 's/([^'"'"' \t\n]+('"'"'([^'"'"'\]|\\'"'"'?)*'"'"'|"([^"\\]|\\"?)*")?) ?/\1\n/gp')
	xargs ./configure --with-http_xslt_module=dynamic <<< ${_options}
	make modules
}

package() {
	cd 'nginx/objs'
	install -Dm644 -t "$pkgdir/usr/lib/nginx/modules/$f" *.so
	install -dm755 "$pkgdir/usr/share/licenses/"
	ln -s '/usr/share/licenses/nginx/' "$pkgdir/usr/share/licenses/$pkgname"
}
