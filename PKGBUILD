# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyfastani
pkgname=python-${_name}
pkgver=0.6.2
pkgrel=1
pkgdesc="Cython bindings and Python interface to FastANI, a method for fast whole-genome similarity estimation"
url="https://github.com/althonos/${_name}"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(5a90e6252fcd8b4d9b60151279d533c45c5aeb323fe4d99d431b2847f1415535)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp311-abi3-linux_${machine}.whl"

    if [ -e "${srcdir}/env" ]; then rm -rf "${srcdir}/env"; fi
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp311-abi3-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
