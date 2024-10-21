# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=scoring-matrices
_module=${_name/-/_}
pkgname=python-${_name}
pkgver=0.3.0
pkgrel=1
pkgdesc="Dependency free, Cython-compatible scoring matrices to use with biological sequences."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/althonos/scoring-matrices"
license=("MIT")
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_module-$pkgver.tar.gz")
sha256sums=(0eba50087f65f752cb7ac3c20f58cbbae6650ed923c3c48070245b64bdebb3cb)

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_module}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_module}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
