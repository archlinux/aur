# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mawcomw <mawcomw@gmail.com>

pkgname=python-sievelib
_pkg="${pkgname#python-}"
pkgdesc="Client-side Sieve and Managesieve library written in Python"
pkgver=1.2.1
pkgrel=2
arch=('any')
url="https://github.com/tonioo/sievelib"
license=('MIT')
depends=('python-setuptools')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('edcb9b416a985a3cc5b7d7f4d7ec013e372ebf90e64c9d9e00e2031299af38fd')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/find_packages()/s/()/(exclude=["sievelib.tests*"])/' setup.py
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
