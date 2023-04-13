# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

_modname=nchan
pkgname=nginx-mainline-mod-$_modname
pkgver=1.3.6
pkgrel=2

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline")
makedepends=('nginx-mainline-src')
url="https://nchan.io/"
license=('MIT')

source=(
	https://github.com/slact/$_modname/archive/v${pkgver}.tar.gz
)

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENCE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

	cd build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}

sha256sums=('ba0b7cc6b710a20ce1ed2554caf56154035291aaf115e407d7a6bb699fde42df')
