# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Jaan Toots <jaan@jaantoots.org>
pkgname=python-xdg
_name=${pkgname#python-}
pkgver=5.1.1
pkgrel=2
pkgdesc="An implementation of the XDG Base Directory Specification in Python"
arch=('any')
url="https://github.com/srstevenson/xdg"
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-pyxdg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f4afbbc21a8405da1a7f4ad8f1d8abd3132aca2ef9c3441b39200d939041160f')

prepare() {
    cd "$srcdir/${_name}-$pkgver"
    # Use basic pyproject.toml to avoid using poetry
    echo -e "[project]\nname=\"${_name}\"\nversion=\"$pkgver\"" > pyproject.toml
}

build() {
    cd "$srcdir/${_name}-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/${_name}-$pkgver"
    PYTHONPATH="$PYTHONPATH:$PWD/src" pytest
}

package() {
    cd "$srcdir/${_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENCE -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
