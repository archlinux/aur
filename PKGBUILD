# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.5.1
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
sha256sums=('fa0f6ad582f3d3320d6b59315cd859ccba6ffab44a0d9a7681b92af89c2490bd')

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
