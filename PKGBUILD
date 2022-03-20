# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=3.4.3
pkgrel=2
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
	'python-sphinx_rtd_theme')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e896621d01dae3b8e8e64819de1f34c885ff4e78005dd88053c04c490a5adb1c')

build() {
	cd "survey-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ make man
}

package() {
	export PYTHONHASHSEED=0
	cd "survey-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/survey.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/survey-$pkgver.dist-info/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
