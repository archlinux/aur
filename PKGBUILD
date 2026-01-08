# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyaragorn
pkgname=python-${_name}
pkgver=0.3.0
_extraver=""
pkgrel=1
pkgdesc="Cython bindings to ARAGORN, a tRNA, tmRNA and mtRNA gene finder."
url="https://github.com/althonos/pyaragorn"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-or-later")
depends=('python')
makedepends=('cython' 'python-pycparser' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}${_extraver}.tar.gz")
sha256sums=(c4ee52bb7fe6738e43980592acaaf3d4d52889a0febbb15ae78e215112cdc60a)

build() {
    cd "${srcdir}/${_name}-${pkgver}${_extraver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp311-abi3-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
    deactivate
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp311-abi3-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}${_extraver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
