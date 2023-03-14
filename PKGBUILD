# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Jaan Toots <jaan@jaantoots.org>
pkgname=python-xdg
_name='xdg-base-dirs'
pkgver=6.0.0
pkgrel=2
pkgdesc="xdg-base-dirs (formerly xdg), an implementation of the XDG Base Directory Specification in Python"
arch=('any')
url="https://github.com/srstevenson/xdg-base-dirs"
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f15938c99f4b03a98e3e8f3e122bc9b5b1c46cf284fe230dbda378f6a762ca4e')

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
