# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyhmmer
pkgname=python-${_name}
pkgver=0.4.11
pkgrel=1
pkgdesc="Cython bindings and Python interface to HMMER3"
url="https://github.com/althonos/pyhmmer"
arch=('x86_64')
license=("MIT")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('0066839b6c2b1e62662de7d4a9f5b6ed0cc1080ea55d64160b3902b52da6aa4b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation    
}

check() {
    local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${pyver}"
    python -c 'import pyhmmer' # attempt importing, PyHMMER doesn't ship tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

