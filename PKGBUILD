# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

_modname=nchan
pkgname=nginx-mod-$_modname
pkgver=1.3.4
pkgrel=1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx")
makedepends=('nginx-src')
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

sha256sums=('ea18db8679e6d35c10c48d03c2b65376957a7761167c8e0edffc4689f599054e')
