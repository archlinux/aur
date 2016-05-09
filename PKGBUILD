# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-uvloop
pkgver=0.4.15
pkgrel=2
_libname=${pkgname/python-/}
pkgdesc="A fast, drop-in replacement of the built-in asyncio event loop."
url="https://github.com/MagicStack/uvloop"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/MagicStack/uvloop/archive/v$pkgver/$_libname-$pkgver.tar.gz"
        "system-libuv.patch")
sha256sums=('f6bea4289cecb506169cc74bbfb5c983db52984563ab2b83507c49b483021340'
            '1c796865a2163eac0ba2034bdbdd85307c929b973a6542c504f4dc08f199e977')

prepare() {
	cd "$srcdir"/$_libname-$pkgver
	sed 's|../vendor/libuv/include/||g' -i uvloop/includes/uv.pxd
	patch -p1 -i "$srcdir"/system-libuv.patch
}

build() {
	cd "$srcdir"/$_libname-$pkgver
	make
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
