# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=igua
pkgname=${_name}
pkgver=0.2.2
_version=${pkgver}
pkgrel=1
pkgdesc="Iterative Gene clUster Analysis, a high-throughput method for gene cluster family identification."
url="https://github.com/zellerlab/IGUA"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-or-later")
depends=('python' 'python-scipy' 'python-gb-io' 'python-rich' 'python-numpy' 'python-pandas' 'python-anndata' 'python-biopython' 'mmseqs2')
makedepends=('python-maturin' 'python-build' 'python-installer')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${_version}.tar.gz")
sha256sums=(302bf9bab8d2308ef17b7962a2d8b5b437a198aefc4055fe94d9a35b3a31205f)

build() {
    cd "${srcdir}/${_name}-${_version}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${_version}/dist/${_name}-${_version}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    igua --help >/dev/null

    deactivate
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${_version}/dist/${_name}-${_version}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${_version}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
