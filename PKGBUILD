# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-pagespeed
pkgver=1.12.34.2
pkgrel=5

_modname="ngx_${pkgname#nginx-mainline-mod-}"

_nginxver=1.13.3
_pagespeedver=latest-stable

pkgdesc="PageSpeed module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://modpagespeed.com"
license=('Apache')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/pagespeed/$_modname/archive/$_pagespeedver/$_modname-$_pagespeedver.tar.gz
)
source_i686=(pagespeed-$pkgver-i686.tar.gz::https://dl.google.com/dl/page-speed/psol/$pkgver-ia32.tar.gz)
source_x86_64=(pagespeed-$pkgver-x86_64.tar.gz::https://dl.google.com/dl/page-speed/psol/$pkgver-x64.tar.gz)

sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72'
            '09d341e73b831e36e2a9ec542019554df888b4b798723f1c956060ccdd12a9c0')
sha256sums_i686=('cf54611bf8713a0dcb13ff274b011cb2a00c738b53afacb39edc64df7687f7fc')
sha256sums_x86_64=('f5e53a07dff6b38075aa811f8a973b10db9f7c1d61464fd76b55b398f478e2c5')

prepare() {
	cd "$srcdir"/$_modname-$_pagespeedver
	ln -s ../psol
	sed -r 's@^pagespeed_libs="(\$psol_binary.*)"@pagespeed_libs="\1 -Wl,-z,noexecstack"@' -i config
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-$_pagespeedver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
