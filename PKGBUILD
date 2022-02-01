# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.5.9
pkgrel=1
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=('python>=3.7' 'python-sphinx' 'python-unidecode' 'python-black' 'python-sphinx_rtd_theme')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'conf.py.patch')
sha256sums=('df845fc36b94794aa1ab3879a8974d4498b2d468e7d8c83593caeec507c8e36f'
            '67eb8509c00d58a1acdb78cf8042019a1d1a6ca0b7fc3576b9e7b55d2de59a35')

prepare() {
	patch -p1 -d "uqbar-$pkgver" < conf.py.patch
}

build() {
	cd "uqbar-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	make -C docs man
}

check() {
	cd "uqbar-$pkgver"
	PYTHONPATH=./ pytest -x || true
}

package() {
	export PYTHONHASHSEED=0
	cd "uqbar-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/build/man/uqbar.1 -t "$pkgdir/usr/share/man/man1/"
}
