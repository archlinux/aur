# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-codon-adaptation-index
pkgver=1.0.2
pkgrel=1
pkgdesc="Implementation of the codon adaptation index"
arch=('any')
url="https://github.com/benjamin-lee/codonadaptationindex"
license=('MIT')
depends=('python-biopython' 'python-click' 'python-scipy')
makedepends=(
	'python-sphinx'
	'python-sphinxcontrib-programoutput'
	'python-setuptools'
	'python-build'
	'python-install'
	'python-wheel')
checkdepends=('python-pytest')
provides=('python-CAI')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ab778e6f9b7a00f0cbaedeb4324609ae78627a2ee19a5c97cd80a964824636e')
validpgpkeys=()

prepare() {
	cd "CodonAdaptationIndex-$pkgver"
	sed -i '/use_2to3/d' setup.py
}

build() {
	cd "CodonAdaptationIndex-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	PYTHONPATH=../ make man
}

check() {
	cd "CodonAdaptationIndex-$pkgver"
	PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "CodonAdaptationIndex-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 paper/paper.{md,bib} -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/cai.1 -t "$pkgdir/usr/share/man/man1/"
}
