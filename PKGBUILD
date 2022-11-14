# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

_modname=nchan
pkgname=nginx-mainline-mod-$_modname
pkgver=1.3.5
pkgrel=1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline")
makedepends=('nginx-mainline-src')
url="https://nchan.io/"
license=('MIT')

source=(
	https://github.com/slact/$_modname/archive/v${pkgver}.tar.gz
        https://github.com/slact/nchan/commit/bc6e17188a90f3cccfd30bfb5b49af63fc1cf6f4.diff
        https://github.com/slact/nchan/commit/0e8702c1bd846fe32a37b0e57c924d0c0010d37f.diff
)

prepare() {
        patch -p1 -d $_modname-$pkgver < bc6e17188a90f3cccfd30bfb5b49af63fc1cf6f4.diff
        patch -p1 -d $_modname-$pkgver < 0e8702c1bd846fe32a37b0e57c924d0c0010d37f.diff
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

sha256sums=('f5a5a5dd6170fd750a232227654cdce8cdb0c3d36d114fe9b6b735641e2ccee1'
            '8adbdb71c7789c4a7a3d004ffd782fafc3e0c609dc3decec723eb5e9aee9c6d1'
            '7c776f270f0d381c22f7d7458f708ca4c6b909db040204a9a07713c73069bca7')
