# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.6.0
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://botorch.org'
license=('MIT')
depends=('python>=3.7' 'python-pytorch' 'python-gpytorch' 'python-scipy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-sphinx')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/botorch/botorch-$pkgver.tar.gz")
sha256sums=('e8d4c2c7187c20b12251f7b791b964ce311ed8cdca28b8bb7ebbedf745f92987')

prepare() {
	cd "botorch-$pkgver"
	sed -i "/packages=/c\packages=find_packages(exclude=['test*'])," setup.py
	cd sphinx
	sed -i "/^version/c\version = '$pkgver'" source/conf.py
}

build() {
	cd "botorch-$pkgver"
	python setup.py build
	cd sphinx
	make man
}

check() {
	cd "botorch-$pkgver"
	pytest -x
}

package() {
	cd "botorch-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 sphinx/build/man/botorch.1 -t "$pkgdir/usr/share/man/man1/"
	find docs \
		-type f \
		-name '*.md' \
		-exec install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
