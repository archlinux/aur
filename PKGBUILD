# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyswrd
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="Cython bindings and Python interface to SWORD, a method for query-database alignment."
url="https://github.com/althonos/pyswrd"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-pyopal' 'python-scoring-matrices')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(ca567e8e685b3c33b657e3e3cc27929f7a768ffc24af73b41f08c5f697beab37)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local impl=$(python -c 'import platform; print(platform.python_implementation().lower())')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${impl}-${pyver}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
