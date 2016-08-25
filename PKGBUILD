# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-uvloop
pkgver=0.5.3
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A fast, drop-in replacement of the built-in asyncio event loop."
url="https://github.com/MagicStack/uvloop"
license=('MIT' 'APACHE')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
makedepends=('cython' 'python-setuptools')
source=("$url/archive/v$pkgver/$_libname-$pkgver.tar.gz")
sha256sums=('29adab0ed5e9c2f89aaedb5e815af578e0bcd64f0996b1e4a9c72e936faba03c')

prepare() {
	cd "$srcdir"/$_libname-$pkgver
	echo "DEF DEBUG = 0" > uvloop/__debug.pxi
	cat <<EOF > setup.cfg
[build_ext]
inplace=1
use-system-libuv=1
EOF
}

build() {
	cd "$srcdir"/$_libname-$pkgver
	cython -3 uvloop/loop.pyx
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -m0644 -D LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
	install -m0644 -D LICENSE-APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
}
