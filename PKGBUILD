# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyhmmer
pkgname=python-${_name}
pkgver=0.7.4
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
sha256sums=(e3ce2719628ce8f1c7ee0b604ca68ca33ccf0b3c77f785a720fa96aa86295c5f)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
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
