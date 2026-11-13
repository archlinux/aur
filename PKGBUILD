# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mawcomw <mawcomw@gmail.com>

pkgname=python-sievelib
_pkg="${pkgname#python-}"
pkgdesc="Client-side Sieve and Managesieve library written in Python"
pkgver=1.6.0
pkgrel=1
arch=('any')
url="https://github.com/tonioo/sievelib"
license=('MIT')
depends=('python>=3.10')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'python-typing_extensions')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('55c11ad3f404aac5ff0f4ec9e0ae354e1d803aed72c44524598d25deac86b0b8')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '2d' MANIFEST.in
	rm -rf "$_pkg.egg-info"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
