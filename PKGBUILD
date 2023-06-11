# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.4.0
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('any')
url="https://github.com/Exahilosys/survey"
license=('MIT')
depends=('python-wrapio')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-autodoc-typehints'
	'python-sphinx-paramlinks')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b4304c6a8e7e280b6be38821d667c83b7f1afc481203e4d4940af7815f7e0890')

build() {
	cd "survey-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	export PYTHONHASHSEED=0
	cd "survey-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/survey.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/survey-$pkgver.dist-info/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
