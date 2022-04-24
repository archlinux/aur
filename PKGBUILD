# Maintainer: Daniel Vrátil <me@dvratil.cz>

_name=aqtinstall
pkgname=python-aqtinstall
pkgver=2.1.0
pkgrel=1
pkgdesc="Another unofficial Qt installer"
arch=(any)
url="https://github.com/miurahr/aqtinstall"
license=('MIT')
depends=(python python-defusedxml python-requests python-beautifulsoup4
         python-semantic-version python-texttable python-patch
         python-py7zr)
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-socket')
source=($pkgname::git+${url}.git#tag=v${pkgver})
sha512sums=('SKIP')

build() {
    cd ${pkgname}
    python setup.py build
}

check() {
    cd ${pkgname}
    mkdir -p temp
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python setup.py install --root=temp --optimize=1 --skip-build
    PYTHONPATH="$PWD/temp/$site_packages" pytest
}

package() {
    cd ${pkgname}
    python setup.py install -O1 --root="${pkgdir}" --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
