# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=nginx-mainline-mod-http-xslt-filter
pkgver=1.13.3
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc='HTTP XSLT module for the Nginx web server'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('nginx-mainline' 'libxslt')
url="https://nginx.org"
license=('custom')

source=(http://nginx.org/download/nginx-$_nginxver.tar.gz)
sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72')

build() {
	cd "$srcdir"/nginx-$_nginxver
	opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
	IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
	./configure "${opts[@]}" --with-http_xslt_module=dynamic
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
