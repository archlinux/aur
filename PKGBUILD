# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-single-source
pkgver=0.3.0
pkgrel=1
pkgdesc="Python library for accessing project versions"
arch=('any')
url="https://github.com/rabbit72/single-source"
license=('MIT')
depends=('python')
optdepends=('python-importlib-metadata>=3.0: REQUIRED for python<3.8')
makedepends=('python-poetry' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f0c9a8e004472fee89e688f712b77fbd6a334172f7fedb3fe05f332034adf5a')

build() {
	cd "single-source-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "single-source-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "single-source-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/single_source-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"

}
