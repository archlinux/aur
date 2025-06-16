# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyswrd
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="Cython bindings and Python interface to SWORD, a method for query-database alignment."
url="https://github.com/althonos/pyswrd"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-pyopal' 'python-scoring-matrices')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(dfae4c73e8362903a0aef9d4cb784ea146568facd016e5ddd494935e731f730c)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
