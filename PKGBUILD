# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-flippernested
_name=FlipperNestedRecovery
pkgver=2.3.2
pkgrel=1
pkgdesc="Recover keys from collected nonces using the Flipper Zero"
arch=('x86_64')
url="https://github.com/AloneLiberty/FlipperNestedRecovery"
license=('LGPL3')
depends=(
    'python-protobuf'
    'python-pyserial'
    'xz'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/AloneLiberty/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('41a5c9e362225f819e04544526279c222a922760a474c1663ae38a4b267ea748e0230fbb44c1a9a1936ed77428198416b838d5ce61e96e4ea0999085f6f22695')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python tests/test_calculate.py
    python tests/test_import.py
    python tests/test_parse.py
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
