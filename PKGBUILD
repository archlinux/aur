# Maintainer: IP2Location <support@ip2location.io>
pkgname=ip2location-io-python
pkgver=1.0.4  # Replace with the actual latest version
pkgrel=1
pkgdesc="A Python client library for accessing the IP2Location.io API."
arch=('any')
url="https://github.com/ip2location/ip2location-io-python"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ip2location/ip2location-io-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e26d1b2fd67af00af2f7d536dfee1fed632f2f46843766069b77e006dd03387d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # Build the wheel
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Use python -m installer to install into the package directory
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Remove any existing virtual environment to avoid conflicts
    rm -rf test-env
    
    # Create and activate a new virtual environment
    python -m venv --system-site-packages test-env
    
    # Build the wheel if it hasn't been built yet
    test-env/bin/python -m pip install build
    test-env/bin/python -m build --wheel
    
    # Install the generated wheel into the virtual environment
    test-env/bin/python -m pip install dist/*.whl
    
    # Run pytest within the virtual environment
    test-env/bin/python -m pytest

}
