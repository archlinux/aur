# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=installer
pkgname=python-$_pkgname-git
pkgver=0.4.0.r68.g777a499
pkgrel=1
pkgdesc='Low-level library for installing a Python package from a wheel distribution'
arch=('any')
url='https://github.com/pradyunsg/installer'
license=('MIT')
depends=(python)
provides=("python-$_pkgname=$pkgver")
makedepends=(
	git
	python-build
	python-sphinx
	python-sphinx-furo
	python-myst-parser
)
checkdepends=(python-pytest python-mock)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build -w
	PYTHONPATH=src sphinx-build -b dirhtml -v docs docs/build/html
}

check() {
	cd "$srcdir/$_pkgname"
	PYTHONPATH=src pytest
}

package() {
	cd "$srcdir/$_pkgname"

	local ver=$(git describe --abbrev=0 --tags)
	PYTHONPATH=src python -m installer -d "$pkgdir" "dist/$_pkgname-$ver-py3-none-any.whl"

	# remove windows entrypoint scripts executables
	rm "$pkgdir/usr/lib"/python*/site-packages/installer/_scripts/*.exe

	# install documentation
	install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
	cp -r -a --no-preserve=ownership docs/build/html "$pkgdir/usr/share/doc/$pkgname"
	rm -rf "$pkgdir/usr/share/doc/$pkgname/html/.doctrees"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
