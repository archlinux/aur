# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-pagespeed
pkgver=1.12.34.3
pkgrel=2

_modname="ngx_${pkgname#nginx-mainline-mod-}"

_nginxver=1.13.5
_pagespeedver=$pkgver-stable
_psolver=1.12.34.2

pkgdesc="PageSpeed module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://modpagespeed.com"
license=('Apache')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/pagespeed/$_modname/archive/v$_pagespeedver/$_modname-$_pagespeedver.tar.gz
)
source_i686=(pagespeed-$_psolver-i686.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-ia32.tar.gz)
source_x86_64=(pagespeed-$_psolver-x86_64.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-x64.tar.gz)

sha256sums=('0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e'
            '7bc56a2fd9c0ac435df6d0f1242b8e9311e0389dfb095e5fc901c122ca368aef')
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
