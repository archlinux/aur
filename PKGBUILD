# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.3.4
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging" "python-sphinx" "python-sphinx-argparse" "make")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher" "python-argcomplete")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('cdb0461e53cf42d4843217fd28de2842b7c26d581c0337677ddff4b35313588eacc444ac719784cdb4be299c557bed4fd251e36a854e11dcaae801b739db3910')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  # TODO: This is not possible with setuptools-rust 0.12.1 due to a bug which has been since fixed
  # SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build_rust --inplace --release build_man
  # Instead we need this mess to do it manually
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  local python_version_dot=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cp "$PWD/build/lib.linux-$CARCH-${python_version_dot}/portmodlib/portmod.cpython-${python_version}-$CARCH-linux-gnu.so" portmodlib/
  make -C doc man
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir --optimize=1
}
