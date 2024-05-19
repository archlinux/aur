# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=3.4.0
pkgrel=1
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-archspec')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
optdepends=('python-isal: fast gzip decompression support'
            'python-lz4: lz4 decompression support'
            'python-zstandard: zstd decompression support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(d4714e8f9208b7768f89bca9f47013e9f18f978e4baf43176a67af9cb26c7c79)

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
