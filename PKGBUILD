# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-addon-pagespeed
pkgver=1.11.33.4
pkgrel=1

_nginxver=1.11.10
_pagespeedver=latest-stable

pkgdesc="PageSpeed module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('git')
url="https://modpagespeed.com"
license=('Apache')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/pagespeed/ngx_pagespeed/archive/$_pagespeedver/pagespeed-module-$_pagespeedver.tar.gz
	pagespeed-$pkgver.tar.gz::https://dl.google.com/dl/page-speed/psol/$pkgver.tar.gz
)

sha256sums=('778b3cabb07633f754cd9dee32fc8e22582bce22bfa407be76a806abd935533d'
            '5b8bebc3124ba55388fcb97ee8f6009bd5d061c48bf274a04f6c99b7364e1f85'
            '97408b04bf7395ab34d7b5baed95ae3dc928746213ca02590773b66a7697a7dc')

prepare() {
	cd "$srcdir"/ngx_pagespeed-$_pagespeedver
	ln -s ../psol
	sed -r 's@^pagespeed_libs="(\$psol_binary.*)"@pagespeed_libs="\1 -Wl,-z,noexecstack"@' -i config
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat \
	            --add-dynamic-module=../ngx_pagespeed-$_pagespeedver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver
	install -Dm755 objs/ngx_pagespeed.so \
	               "$pkgdir"/usr/lib/nginx/modules/ngx_pagespeed.so
}
