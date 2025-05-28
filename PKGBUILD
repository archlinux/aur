# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyaragorn
pkgname=python-${_name}
pkgver=0.1.0
_extraver=""
pkgrel=2
pkgdesc="Cython bindings to ARAGORN, a tRNA, tmRNA and mtRNA gene finder."
url="https://github.com/althonos/pyaragorn"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-or-later")
depends=('python')
makedepends=('cython' 'python-pycparser' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}${_extraver}.tar.gz")
sha256sums=(17dcee8bb9213eafdd0a1d509f03328f39e18ab00cee2ab119ceca7e0b223f19)

build() {
    cd "${srcdir}/${_name}-${pkgver}${_extraver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
    deactivate
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}${_extraver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
