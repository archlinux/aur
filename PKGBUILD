# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Francois Garillot <francois[at]garillot.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=python-demjson
_pkgname=${pkgname#python-}
pkgver=2.2.4
pkgrel=6
pkgdesc="Encoder, decoder, and lint/validator for JSON (JavaScript Object Notation) compliant with RFC 7159"
arch=('any')
url="https://github.com/dmeranda/demjson"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
provides=('demjson')
conflicts=('demjson' 'nodejs-jsonlint')
replaces=('demjson')
sha256sums=('31de2038a0fdd9c4c11f8bf3b13fe77bc2a128307f965c8d5fb4dc6d6f6beb79'
    'd9610935c5e7ae7256c5c8146d52602466226c746fc3ccb2b84fbed59a7aefee')
# https://warehouse.pypa.io/api-reference/integration-guide.html#querying-pypi-for-package-urls
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
    "setup.py.patch")

build() {
    cd "$_pkgname-$pkgver"
    # Remove references to 2to3 (not supported since setuptools v58.0.0)
    patch -p1 <"$srcdir/setup.py.patch"
    # Run 2to3 transformations manually
    2to3 -wn . jsonlint
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
