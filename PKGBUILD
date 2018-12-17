# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-pagespeed
pkgver=1.13.35.2
pkgrel=13

_modname="ngx_${pkgname#nginx-mainline-mod-}"

_nginxver=1.15.7
_pagespeedver=$pkgver-stable
_psolver=$pkgver

pkgdesc="PageSpeed module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://www.ngxpagespeed.com/"
license=('Apache')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/pagespeed/$_modname/archive/v$_pagespeedver/$_modname-$_pagespeedver.tar.gz
)
source_i686=(pagespeed-$_psolver-i686.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-ia32.tar.gz)
source_x86_64=(pagespeed-$_psolver-x86_64.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-x64.tar.gz)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93'
            'SKIP'
            '68242a30308b21f13de9a36f2aea5c3e34e8a4c0b7c6a37d3369334f6f847d36')
sha256sums_i686=('9155acfc1764c3554ef21b17b00739d6879822eabeada9a1578a848b0b2d70d0')
sha256sums_x86_64=('df3ba3c8fc54e13845d0a1daa7a6e3d983126c23912851bbf8ba35be646a434f')

prepare() {
	cd "$srcdir"/incubator-pagespeed-ngx-$_pagespeedver
	ln -s ../psol
	sed -r 's@^pagespeed_libs="(\$psol_binary.*)"@pagespeed_libs="\1 -Wl,-z,noexecstack"@' -i config
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../incubator-pagespeed-ngx-$_pagespeedver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
