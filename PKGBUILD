# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-normality
_pkg="${pkgname#python-}"
pkgver=2.3.3
pkgrel=1
pkgdesc='Micro-library for normalizing text strings'
license=('MIT')
arch=('any')
url='https://github.com/pudo/normality'
depends=('python-banal' 'python-text-unidecode' 'python-chardet' 'python-charset-normalizer')
optdepends=('python-pyicu: greatly improves text transliteration compared to python-text-unidecode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyicu')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8dc5ad1be2cc1edeabc5960419e61d07f35ffe4d51f8027181dd4f0c04bc962a')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/packages=find_packages/s/test/tests*/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
