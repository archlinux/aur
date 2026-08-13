# Contributor: redponike <proton (dot) me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Ray Ganardi <rayganardi [at] gmail [dot] com>
# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Contributor: Sebastian Krämer <basti.kr@gmail.com>

pkgname=python-qutip
pkgver=5.3.1
pkgrel=1
pkgdesc="Open-source software for simulating the dynamics of open quantum systems"
arch=(x86_64 aarch64)
url='https://github.com/qutip/qutip'
license=(BSD-3-Clause)
depends=(
    glibc
    libgcc libgcc_s.so
    python-numpy
    python-packaging
    python-scipy
)
makedepends=(
    cython
    gcc-fortran
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    ipython
    python-ipyparallel
    python-pytest
)
optdepends=(
    'cython: Runtime complilation support'
    'ipython: Interactive REPL support'
    'psutils: PostScript support'
    'python-cvxopt: Convex optimization support'
    'python-cvxpy: Convex optimization support'
    'python-ipyparallel: Parallel interactive computing'
    'python-matplotlib: graphical output support'
    'texlive-bin: Optional, Needed if using LaTeX in figures.'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('47c0ccea4f39a05151e001b859c26ec6f2d5836b3b91d377dd3a0d0ba39310e714dbbea15b7cfa966733818ea867feee28cf9250eb1eff3bb72e4bdcd069e906')

_site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

prepare() {
    cd "qutip-$pkgver"
    sed -i '/packages/c\packages = { find = { include = ["qutip*"], exclude = ["qutip.tests*"] } }' pyproject.toml
}

build() {
    cd "qutip-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "qutip-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -c 'import qutip.testing; qutip.testing.run()'
}

package() {
    cd "qutip-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site_packages/qutip-$pkgver.dist-info/licenses/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
