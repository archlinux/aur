# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=python-odoorpc
_name=OdooRPC
pkgver=0.10.1
pkgrel=1
pkgdesc='Python module providing an easy way to pilot your Odoo servers through RPC.'
arch=('any')
url='https://github.com/OCA/odoorpc'
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'model-repr-sphinx.patch')
sha256sums=('d0bc524c5b960781165575bad9c13d032d6f968c3c09276271045ddbbb483aa5'
            'b269c5b5517c736b11f4ca5800b55674f5431c39d38bfc7544a838fbaa6b8e7d')

prepare() {
	cd "$_name-$pkgver"
	patch -Np1 -i ../model-repr-sphinx.patch
}

build() {
	cd "$_name-$pkgver"
	python setup.py build

	cd doc
	PYTHONPATH=../ make man
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 doc/build/man/odoorpc.1 -t "$pkgdir/usr/share/man/man1/"
}
