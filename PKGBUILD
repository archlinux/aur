# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=dbxfs
pkgver=1.0.44
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-dropbox>=11.0.0' 'python-appdirs' 'python-userspacefs'
         'python-block_tracing' 'python-privy' 'python-keyrings-alt' 'python-sentry_sdk')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        "$pkgname.patch")
sha256sums=('a98e58879c44a75de304c06e6ae15739ffeb5fbee74d8128426ce2d4f4535017'
            'SKIP'
            'cc238c6562ec327efeba4f48e4523808338658b2b1f38b1fb6a901ba938c4868')
validpgpkeys=('584EDA5AAC13B9FBFB13F678A6A5398DACC9C15C') # Rian Hunter <rian@thelig.ht>

prepare() {
	cd $pkgname-$pkgver

	# Disable update check
	patch -Np1 -i "$srcdir/$pkgname.patch"

	sed -i 's/keyrings.alt>=3.1,<4/keyrings.alt>=3.1/g' setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
