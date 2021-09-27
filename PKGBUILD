# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.91.20210515
pkgrel=1
pkgdesc="Utilities for Bitcoin and altcoin addresses and transaction manipulation"
url="https://github.com/richardkiss/pycoin"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-sphinx')
checkdepends=('python-pytest')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycoin/pycoin-$pkgver.tar.gz")
sha256sums=('d2231a8d11b2524c26472d08cf1b76569849ab44507495d0510165ae0af4858e')

prepare() {
	cd "pycoin-$pkgver"
	sed -i \
		-e "/'block/s/block/pycoin-block/" \
		-e "/'ku/s/ku/pycoin-ku/" \
		-e "/'tx/s/tx/pycoin-tx/" \
		-e "/'msg/s/msg/pycoin-msg/" \
		-e "/'keychain/s/keychain/pycoin-keychain/" \
		-e "/'b58/s/b58/pycoin-b58/" \
		-e "/'coinc/s/coinc/pycoin-coinc/" \
		setup.py
}

build() {
	cd "pycoin-$pkgver"
	python setup.py build
	cd docs
	make man
}

check() {
	cd "pycoin-$pkgver"
	pytest
}

package() {
	cd "pycoin-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md CREDITS -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/_build/man/pycoin.1 -t "$pkgdir/usr/share/man/man1/"
}
