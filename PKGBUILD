# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=sensai-utils
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.6.0
pkgrel=1
pkgdesc="Utilities from sensAI, the Python library for sensible AI"
arch=('any')
url="https://github.com/opcode81/sensAI"
license=('MIT')
depends=(
    'python'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('e50ae6bbd7c62a961f25b98e55b29029450efd66444678931b3b9c43e9bf9e95')

prepare() {
    cd "$_pipname-$pkgver"
    # The PyPI sdist omits requirements.txt, but setup.py reads it for
    # install_requires (FileNotFoundError otherwise). Recreate it with the sole
    # runtime dependency so the PEP517 build can resolve build requirements.
    [ -f requirements.txt ] || echo 'typing_extensions>=4.6.0' > requirements.txt
}

build() {
    cd "$_pipname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pipname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
