# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.5.7
pkgrel=1
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=('python>=3.7' 'python-sphinx' 'python-unidecode' 'python-black' 'python-sphinx_rtd_theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'conf.py.patch')
sha256sums=('870fedd901f8e3d514bc0cc4961c6da26cedd8bdeb5717f951c92dcc09e1f41e'
            '67eb8509c00d58a1acdb78cf8042019a1d1a6ca0b7fc3576b9e7b55d2de59a35')

prepare() {
	patch -p1 -d "uqbar-$pkgver" < conf.py.patch
}

build() {
	cd "uqbar-$pkgver"
	python setup.py build
	make -C docs man
}

package() {
	export PYTHONHASHSEED=0
	cd "uqbar-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/build/man/uqbar.1 -t "$pkgdir/usr/share/man/man1/"
}
