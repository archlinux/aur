# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dot com>

pkgname=python-anticaptcha
pkgver=1.0.0
pkgrel=1
pkgdesc="Client library for solving captchas with anticaptcha.com support."
arch=('any')
url="https://github.com/ad-m/python-anticaptcha"
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-sphinx' 'python-wheel')
# checkdepends=('python-retry' 'python-nose2' 'python-selenium')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('058a9e3ca5dbdcaa98108c8b5181404cb4ffdba5261162a4301d60f985c63710')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

## tests require API key to run
# check() {
# 	cd "$pkgname-$pkgver"
# 	python -m unittest discover
# }

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE.md" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
