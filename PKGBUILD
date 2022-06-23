# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=nginx-mainline-mod-headers-more-git
pkgver=0.33.r15.ge536bc5
pkgrel=1

pkgdesc="Set and clear input and output headers (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/headers-more-nginx-module"
license=('BSD')
sha256sums=('SKIP')

source=(headers-more-nginx-module::git+https://github.com/openresty/headers-more-nginx-module.git)

pkgver() {
	cd headers-more-nginx-module
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module="$srcdir"/headers-more-nginx-module
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
