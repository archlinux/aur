# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=3.2.2
pkgrel=1
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("LGPL3")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python' 'python-archspec')
optdepends=('python-isal: fast gzip decompression support'
            'python-lz4: lz4 decompression support'
            'python-zstandard: zstd decompression support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(0e02b2089df29c3c0f1379364664f4a83da12373233bb74d7a95d24a346b02ec)

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
