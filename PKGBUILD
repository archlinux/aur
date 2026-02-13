# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-pytest-recording
_pkgname=${pkgname#python-}
pkgver=0.13.4
pkgrel=3
pkgdesc='Pytest plugin to record network interactions with VCR.py'
arch=('any')
url="https://pypi.org/project/${_pkgname//-/_}"
_url='https://github.com/kiwicom/pytest-recording'
license=('MIT')
depends=(python 'python-vcrpy>=7.0.0' python-pytest)
makedepends=(python-build python-installer python-hatchling)
optdepends=(
    'python-pycurl: Block pycurl-based network connections'
)
checkdepends=(
    python-pytest
    python-pytest-httpbin
    python-pytest-mock
    python-requests
    python-werkzeug
)
source=("$pkgname-$pkgver::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c86e695e95acbe0ad2576410397950193a78de65be0c91c98f4ba7fa8e705a3e')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest \
        --disable-plugin-autoload \
        -p recording -p httpbin -p pytest_mock
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
