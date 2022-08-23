# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>

pkgname=python-omegaconf
_pkg="${pkgname#python-}"
pkgver=2.2.3
pkgrel=1
pkgdesc='Flexible Python configuration system'
arch=('any')
url='https://github.com/omry/omegaconf'
license=('BSD')
depends=('python-antlr4' 'python-pyaml')
makedepends=(
	'java-runtime'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-mock')
changelog=NEWS.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9586b6623d4abf514979612f987261971a58da2dc7a9224bebd017848c9ad80a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 DISCLAIMER -t "$pkgdir/usr/share/licenses/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	ln -s "$_site/omegaconf-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
