# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-hstspreload
_pkg="${pkgname#python-}"
pkgver=2024.11.1
pkgrel=1
pkgdesc="Chromium HSTS Preload list as a Python package"
arch=(any)
url="https://github.com/sethmlarson/hstspreload"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
#checkdepends=(python-pytest python-urllib3)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1dc00fd6517284ec32ca0e0955bd5de9d1b1475c2ad196cb9e2933dc05a51d6e')

build() {
    cd $_pkg-$pkgver
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
    cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -vdm 755 "$pkgdir/usr/share/licenses/$pkgname/"
    ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
