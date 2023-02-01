# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.23.3
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python-graphviz' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "resources.patch")
sha256sums=('543c707c36a2c896dfdf8f23e993a9c7ae48bb1a667f6baf19151eb98e57a134'
            'a32edb9d779f786fd02632d95cdd0b22a45e3e845b3c63e8c9ab2491b6396732')

prepare() {
    cd $_name-$pkgver
    patch -p1 < ../resources.patch
}

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root "$pkgdir" --skip-build --optimize=1

    local site_packages
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    find resources/ -type f -exec install -Dm644 "{}" "$pkgdir/$site_packages/$_name/{}" \;

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
