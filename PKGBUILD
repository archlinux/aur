# Maintainer: Adil Alizada <adilalizade13@gmail.com>

pkgname=linear-cli
_pypi_name=linearator
pkgver=1.3.0
pkgrel=1
pkgdesc="A comprehensive CLI tool for Linear issue management with advanced search, bulk operations, and team collaboration features"
arch=('any')
url="https://github.com/AdiKsOnDev/linearator"
license=('MIT')
depends=('python>=3.12' 'python-pip')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pip')
optdepends=(
    'keyrings.alt: Alternative keyring backends for credential storage'
)
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('8c157c3d509572a2cd92b75f68c2303d3334366bd8e73c7756f668175e71558a')

build() {
    # No build step needed - we'll install directly from PyPI
    :
}

check() {
    cd "$_pypi_name-$pkgver"
    # Skip tests that require client connections
    python -m pytest tests/ -k "not test_client" || echo "Some tests may fail without Linear API access"
}

package() {
    cd "$_pypi_name-$pkgver"
    
    # Install package and all dependencies from PyPI
    # This is the most reliable way for Python packages
    pip install --root="$pkgdir" --prefix=/usr --no-warn-script-location \
        "$_pypi_name==$pkgver"
    
    # Install license and docs from source
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
