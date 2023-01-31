# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-hstspreload
_pkg="${pkgname#python-}"
pkgver=2023.1.1
pkgrel=1
pkgdesc="Chromium HSTS Preload list as a Python package"
arch=('any')
url="https://github.com/sethmlarson/hstspreload"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pytest' 'python-urllib3')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('b2330a88b3fe3344c9eb431257e1ff3ae06c3bc2ff87ca686a5f253e2881a6c1')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# This runs around 230k tests, checking to see if the online list matches the current one.
# It can take 5 minutes just to collect the tests. They're not distributed in the PyPI tarball.
#check() {
#    cd "${srcdir}"/${_pkg}-${pkgver}
#
#    python -m pytest
#}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
