# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=3.7.1
pkgrel=1
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-archspec')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core')
optdepends=('python-isal: fast gzip decompression support'
            'python-lz4: lz4 decompression support'
            'python-zstandard: zstd decompression support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(0262fc5b5fd0b16c18eb3eb9b6079e1590e6d838c3f8431c46d9027c8e67f600)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
    deactivate
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
