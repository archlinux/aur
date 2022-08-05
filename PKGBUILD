# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyfamsa
pkgname=python-${_name}
pkgver=0.1.0
pkgrel=1
pkgdesc="Cython bindings and Python interface to FAMSA, an algorithm for ultra-scale multiple sequence alignments"
url="https://github.com/althonos/pyfamsa"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL3")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer' 'python-semantic-version')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(3841e5e3f8933926f093f858247910f8c7310654a12cdedb4319760f48755b4c)

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
