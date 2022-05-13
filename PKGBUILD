# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal
pkgname=python-${_name}
pkgver=1.0.2
pkgrel=1
pkgdesc="Cython bindings to Prodigal, an ORF finder for genomes and metagenomes"
url="https://github.com/althonos/pyrodigal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("LGPL3")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(a1f717313efdd1090b2c2dc235fb17396e99062e97b70aa923362f977475dd89)

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
