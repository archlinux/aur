# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=python-survey
pkgver=5.4.2
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('any')
url="https://github.com/Exahilosys/survey"
license=('MIT')
depends=('python')
makedepends=('python-setuptools'
             'python-setuptools-scm'
             'python-sphinx'
             'python-sphinx-autodoc-typehints'
             'python-sphinx-paramlinks'
             'python-sphinx_rtd_theme'
             'python-wheel')
source=("${pkgname}-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f06c53e49b83ea808121687cacb0f923a3ed127fdf78e4a656d28ce173440a03')

prepare() {
	cd "${pkgname#python-}-$pkgver/docs"
	sed -i "s/importlib.metadata.version(project)/\'$pkgver\'/" conf.py
}

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	cd "${pkgname#python-}-$pkgver"
	python setup.py build
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 README.rst "${pkgdir}/usr/share/doc/$pkgname/README.rst"
	install -Dm644 docs/_build/man/${pkgname#python-}.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
