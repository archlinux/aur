# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=3.6.3
_extraver=".post1"
pkgrel=2
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-archspec')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
optdepends=('python-isal: fast gzip decompression support'
            'python-lz4: lz4 decompression support'
            'python-zstandard: zstd decompression support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}${_extraver}.tar.gz")
sha256sums=(f42e8df8062b08796f2e92902800584c0b62ead765945594d06224e0b6c2b96c)

build() {
    cd "${srcdir}/${_name}-${pkgver}${_extraver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}${_extraver}/dist/${_name}-${pkgver}${_extraver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}${_extraver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
