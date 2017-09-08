# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=nginx-mainline-mod-http-xslt-filter
pkgver=1.13.5
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='HTTP XSLT module for the Nginx web server'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('nginx-mainline' 'libxslt')
url="https://nginx.org"
license=('custom')

source=(http://nginx.org/download/nginx-$pkgver.tar.gz)
sha256sums=('0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e')

build() {
	cd "$srcdir"/nginx-$pkgver
	opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
	IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
	./configure "${opts[@]}" --with-http_xslt_module=dynamic
	make modules
}

package() {
	cd "$srcdir"/nginx-$pkgver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
