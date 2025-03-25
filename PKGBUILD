# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=gecco
_pyname=gecco-tool
pkgname=${_name}
pkgver=0.9.10
pkgrel=1
pkgdesc="Gene Cluster prediction with Conditional random fields."
url="https://gecco.embl.de"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("GPL-3.0-only")
depends=('python' 'python-crfsuite' 'python-sklearn-crfsuite' 'python-pyrodigal' 'python-pyhmmer' 'python-biopython' 'python-docopt' 'python-numpy' 'python-polars' 'python-psutil' 'python-rich' 'python-scipy' 'python-scikit-learn')
makedepends=('python-setuptools' 'python-build' 'python-installer')
optdepends=('python-fisher: variable selection with Fisher exact test'
            'python-statsmodels: variable selection with Fisher exact test')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-$pkgver.tar.gz")
sha256sums=(6ab405587824228a2a2baa08ccb9e6df1f6df214fe6c1a531b778a613fb1e90d)

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    whl="${srcdir}/${_pyname}-${pkgver}/dist/${_pyname/-/_}-${pkgver}-py2.py3-none-any.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    gecco -vv run -h >/dev/null
}

package() {
    whl="${srcdir}/${_pyname}-${pkgver}/dist/${_pyname/-/_}-${pkgver}-py2.py3-none-any.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_pyname}-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
