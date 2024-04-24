# Maintainer:  
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Ray Ganardi <rayganardi [at] gmail [dot] com>
# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Contributor: Sebastian Krämer <basti.kr@gmail.com>

_distname=qutip
pkgname="python-${_distname}"
pkgver=4.7.6
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=('x86_64')
url='https://qutip.org/'
license=('BSD-3-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'python'
  'python-numpy'
  'python-packaging'
  'python-scipy<1.13'
)
makedepends=(
  'cython0'
  'gcc-fortran'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'ipython'
  'python-ipyparallel'
  'python-pytest'
)
optdepends=(
  "cython0: Runtime complilation support"
  "ipython: Interactive REPL support"
  "psutils: PostScript support"
  "python-cvxopt: Convex optimization support"
  "python-cvxpy: Convex optimization support"
  "python-ipyparallel: Parallel interactive computing"
  "python-matplotlib: graphical output support"
  "texlive-bin: Optional, Needed if using LaTeX in figures."
)
source=("https://github.com/qutip/qutip/releases/download/v${pkgver}/qutip-${pkgver}.tar.gz")
b2sums=('6f511a731d4945b26d9445969bc6c7b20008c5fe1f5d580710318df37626e9a52565220ca170a9c1bb679ff07982b8db26b86a78640746eadb4fe40d33b1c79d')

_site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

build() {
  cd "$srcdir/$_distname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD$_site_packages:$PYTHONPATH" python -c 'import qutip.testing; qutip.testing.run()'
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  echo "Removing unneeded tests dir..."
  rm -rfv "$pkgdir/${_site_packages}/qutip/tests/"
  rm -fv "$pkgdir/${_site_packages}/qutip/testing.py"
  echo "Finished removing tests dir."
}
