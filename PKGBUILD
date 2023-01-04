# Maintainer: Ray Ganardi <rayganardi [at] gmail [dot] com>
# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Contributor: Sebastian Krämer <basti.kr@gmail.com>
_name=qutip
_pkgname=qutip
pkgname=python-qutip
pkgver=4.7.1
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=("x86_64")
url="http://qutip.org/index.html"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-matplotlib" "cython")
makedepends=("gcc-fortran")
optdepends=(
    "blas: Optional, Needed for installing Fortran Monte Carlo solver."
    "mayavi: Optional, Needed for using the Bloch3d class."
    "python-pyqt4: Optional, required only for GUI elements."
    "texlive-bin: Optional, Needed if using LaTeX in figures."
    "python-nose: Optional, For running tests."
    "python-scikit-umfpack: Optional, Faster (~2-5x) steady state calculations."
    "openmp: Optional, For OPENMP support"
)

source=("https://github.com/qutip/qutip/archive/v$pkgver.tar.gz")
md5sums=('1618b509fa12121337916dd81cc4ffad')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    if pacman -Qq openmp &> /dev/null; then
	    python setup.py build --with-openmp
    else
	    python setup.py build
    fi
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD$site_packages:$PYTHONPATH" python -c 'import qutip.testing; qutip.testing.run()'

}
