# Maintainer: hdhoang <arch@hdhoang.space>

pkgname=nginx-mainline-mod-fancyindex
pkgver=0.4.2
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc='Fancy indexes module for the Nginx web server'
arch=('i686' 'x86_64' 'armv7h')
depends=('nginx-mainline')
url="https://github.com/aperezdc/ngx-fancyindex"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/aperezdc/ngx-$_modname/archive/v$pkgver.tar.gz
)

prepare() {
	cd ngx-$_modname-$pkgver
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
	IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
	./configure "${opts[@]}" \
		--add-dynamic-module=../ngx-$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir/"ngx-$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            '8327150864ca267b735d550d3304030efbbd863fdddfe0a94e970f249a8827ee')
