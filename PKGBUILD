# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.23.4
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python-graphviz' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "resources.patch")
sha256sums=('b7ada0b119b5189dd021b1dc1467fad3704737452bb18b1e06d05e4d1fa48ed7'
            'a32edb9d779f786fd02632d95cdd0b22a45e3e845b3c63e8c9ab2491b6396732')

prepare() {
    cd $_name-$pkgver
    patch -p1 < ../resources.patch
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    local site_packages
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    find resources/ -type f -exec install -Dm644 "{}" "$pkgdir/$site_packages/$_name/{}" \;

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
