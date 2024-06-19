# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyhmmer
pkgname=python-${_name}
pkgver=0.10.13
pkgrel=1
pkgdesc="Cython bindings and Python interface to HMMER3"
url="https://github.com/althonos/pyhmmer"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=("MIT")
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(65ef2211b96d804e17ba30df7061918a9c6c258353e732dba1ead32d2a623b2e)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print(sys.implementation.cache_tag)')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${pyver}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
