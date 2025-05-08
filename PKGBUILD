# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyhmmer
pkgname=python-${_name}
pkgver=0.11.1
pkgrel=1
pkgdesc="Cython bindings and Python interface to HMMER3"
url="https://github.com/althonos/pyhmmer"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=("MIT")
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
depends=('python' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(f83e9a7d80f31713c52291b5c888dddb98c1e765222e064c40d56e87ad91cc4e)

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
    deactivate
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
