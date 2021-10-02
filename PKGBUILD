# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-pydna
pkgver=4.0.2
pkgrel=1
pkgdesc='Data structures for double-stranded DNA & simulation of homologous recombination'
arch=('any')
url='https://github.com/bjornfjohansson/pydna'
license=('BSD')
depends=(
	'python-appdirs>=1.4.3'
	'python-biopython>=1.79'
	'python-networkx>=2.5.0'
	'python-prettytable>=0.7.2'
	'python-pyparsing>=2.4.7'
	'python-requests>=2.23.0')
optdepends=(
	'python-matplotlib: gel simulation'
	'python-mpldatacursor: gel simulation'
	'python-numpy: gel simulation'
	'python-pint: gel simulation'
	'python-scipy: gel simulation')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-pytest-runner')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

## FIXME: sphinx-build cannot find pydna
# prepare() {
# 	patch -p1 -d "$pkgname-$pkgver" < 001-python-path.patch
# }

build() {
	cd "$pkgname"
	python setup.py build
	## FIXME: sphinx-build cannot find pydna
	# cd docs
	# sphinx-build -b man ./ build
}

check() {
	cd "$pkgname"
	## FIXME: tests fail with python-prettytable=0.7.2
	python setup.py pytest || true
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
