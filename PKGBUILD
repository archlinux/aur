# Maintainer: redponike <proton (dot) me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Ray Ganardi <rayganardi [at] gmail [dot] com>
# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Contributor: Sebastian Krämer <basti.kr@gmail.com>

pkgname="python-qutip"
_pkgname=${pkgname#python-}
pkgver=5.1.1
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=('x86_64')
url='https://qutip.org/'
license=('BSD-3-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'python-numpy'
  'python-packaging'
  'python-scipy'
)
makedepends=(
  'cython'
  'gcc-fortran'
  'python-setuptools'
  'python-wheel'
  'python-build'
  'python-installer'
)
checkdepends=(
  'ipython'
  'python-ipyparallel'
  'python-pytest'
)
optdepends=(
  "cython: Runtime complilation support"
  "ipython: Interactive REPL support"
  "psutils: PostScript support"
  "python-cvxopt: Convex optimization support"
  "python-cvxpy: Convex optimization support"
  "python-ipyparallel: Parallel interactive computing"
  "python-matplotlib: graphical output support"
  "texlive-bin: Optional, Needed if using LaTeX in figures."
)
source=("https://github.com/qutip/qutip/releases/download/v${pkgver}/qutip-${pkgver}.tar.gz")
b2sums=('032834ebf4cd001aee9aa064ddac4fc5f95899fa497f5e085b1407bebfad24034d68964dcf0df8cca214a9adf715ab771faad6d6f99018f31119ee0792c97684')

_site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  # pytest -v --pyargs qutip.tests
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD$_site_packages:$PYTHONPATH" python -c 'import qutip.testing; qutip.testing.run()'
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  echo "Removing unneeded tests dir..."
  rm -rfv "$pkgdir/${_site_packages}/qutip/tests/"
  rm -fv "$pkgdir/${_site_packages}/qutip/testing.py"
  echo "Finished removing tests dir."
}
