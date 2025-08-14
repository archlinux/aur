# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname=nginx-mainline-mod-http-xslt-filter
pkgver=1.29.1
pkgrel=1
pkgdesc='Transform nginx XML responses using XSLT stylesheets'
arch=('x86_64')
url='https://nginx.org/en/docs/http/ngx_http_xslt_module.html'
license=('BSD-2-Clause')
depends=('nginx-mainline' 'libxml2' 'libxslt')
makedepends=("nginx-mainline-src=$pkgver")

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	nginx -V 2>&1 |
		grep -o -- '--prefix=.*$' |
		xargs printf '%s\0' |
		sed -z \
			-e'/^--with-.*=dynamic$/d' | \
		xargs -t0 /usr/src/nginx/configure \
			--with-http_xslt_module=dynamic

	make modules
}

package() {
	cd build/objs
	install -Dm644 -t "$pkgdir/usr/lib/nginx/modules/$f" *.so
	install -dm755 "$pkgdir/usr/share/licenses/"
	ln -s '/usr/share/licenses/nginx/' "$pkgdir/usr/share/licenses/$pkgname"
}
