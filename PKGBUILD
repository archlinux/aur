# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=2.1.0
pkgrel=2
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("LGPL3")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(a4c07baa2ceebb052d8b65749c30b41fec998bb7f3600da1979fb0b5f328a34e)

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
