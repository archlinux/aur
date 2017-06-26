# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-pagespeed
pkgver=1.11.33.4
pkgrel=4

_modname="ngx_${pkgname#nginx-mainline-mod-}"

_nginxver=1.13.1
_pagespeedver=latest-stable

pkgdesc="PageSpeed module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://modpagespeed.com"
license=('Apache')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/pagespeed/$_modname/archive/$_pagespeedver/$_modname-$_pagespeedver.tar.gz
	pagespeed-$pkgver.tar.gz::https://dl.google.com/dl/page-speed/psol/$pkgver.tar.gz
)

sha256sums=('a5856c72a6609a4dc68c88a7f3c33b79e6693343b62952e021e043fe347b6776'
            '5b8bebc3124ba55388fcb97ee8f6009bd5d061c48bf274a04f6c99b7364e1f85'
            '97408b04bf7395ab34d7b5baed95ae3dc928746213ca02590773b66a7697a7dc')

prepare() {
	cd "$srcdir"/$_modname-$_pagespeedver
	ln -s ../psol
	sed -r 's@^pagespeed_libs="(\$psol_binary.*)"@pagespeed_libs="\1 -Wl,-z,noexecstack"@' -i config
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-$_pagespeedver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
