# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.5.0
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('any')
url="https://github.com/Exahilosys/survey"
license=('MIT')
depends=('python-wrapio')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-autodoc-typehints'
	'python-sphinx-paramlinks')
source=("https://files.pythonhosted.org/packages/6d/db/9a9abb6b1449bfb3014473e890abc93bc88c01a6e0203d28b8d2ca5d9774/survey-4.5.0.tar.gz")
sha256sums=('d0aa75c718cdfd2d394ae3aad3013ec6ec8ff2080512d9cce2d18fd1092b891f')

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
