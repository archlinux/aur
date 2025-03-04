# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyfamsa
pkgname=python-${_name}
pkgver=0.5.3
_extraver=".post1"
pkgrel=2
pkgdesc="Cython bindings and Python interface to FAMSA, an algorithm for ultra-scale multiple sequence alignments"
url="https://github.com/althonos/pyfamsa"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-scoring-matrices')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}${_extraver}.tar.gz")
sha256sums=(26e95de13adce18e923847591681f085a35fab20eac76887deb6ad12f1b6a06c)

build() {
    cd "${srcdir}/${_name}-${pkgver}${_extraver}"
    python -m build --wheel --no-isolation
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}${_extraver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
