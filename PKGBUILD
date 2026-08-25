# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pycomsa
pkgname=python-${_name}
pkgver=0.1.2
pkgrel=1
pkgdesc="Cython bindings and Python interface to CoMSA, a compressor for multiple-sequence alignments."
url="https://github.com/althonos/pycomsa"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-or-later")
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(23e2c99dab867cd75bf5405985723602662f1cd72cf29b02ec594876bf6ab1b3)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp311-abi3-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp311-abi3-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644 "${srcdir}/${_name}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
