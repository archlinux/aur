# Maintainer: willemw <willemw12@gmail.com>

pkgname=spyder-git
pkgver=6.0.0a1.r358.g2578be8a3
pkgrel=1
pkgdesc="The Scientific Python Development Environment"
arch=('any')
url="https://www.spyder-ide.org/"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-sphinx')
#'icu'
depends=(
    python-atomicwrites
    python-chardet
    python-cloudpickle
    python-cookiecutter
    python-diff-match-patch
    python-intervaltree
    ipython
    python-jedi
    python-jellyfish
    python-jsonschema
    python-keyring
    jupyter-nbconvert
    python-numpydoc
    python-parso
    python-pexpect
    python-pickleshare
    python-psutil
    python-pygments
    python-pylint
    python-pylint-venv
    python-pyqt5
    python-pyqt5-webengine
    python-lsp-server
    python-lsp-black
    python-pyls-spyder
    python-pyxdg
    python-pyzmq
    python-qdarkstyle
    python-qstylizer
    python-qtawesome
    python-qtconsole
    python-qtpy
    python-rtree
    python-setuptools
    python-sphinx
    python-spyder-kernels
    python-textdistance
    python-three-merge
    python-watchdog
    autopep8
    flake8
    python-pycodestyle
    python-pydocstyle
    python-pyflakes
    python-rope
    yapf
    python-whatthepatch

    python-debugpy
    python-pyuca
)
optdepends=(
    'cython: run Cython files in the IPython Console'
    'python-matplotlib: 2D/3D plotting in the IPython Console'
    'python-numpy: support for N-dimensional arrays in the Variable Explorer'
    'python-pandas: support for DataFrames and Series in the Variable Explorer'
    'python-scipy: support for Matlab workspace in the Variable Explorer'
    'python-sympy: symbolic mathematics in the IPython Console'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'spyder3-git')
replaces=('spyder3-git')
source=($pkgname::git+https://github.com/spyder-ide/spyder.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  find $pkgname -type f -iname \*.py -exec sed -i -e 's|"pep8"|"pycodestyle"|g' -e "s|'pep8'|'pycodestyle'|g" '{}' \;
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  # Install a scalable icon for the spyder3.desktop file
  install -Dm644 spyder/images/spyder.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/spyder3.svg"

  rm -f "$pkgdir/usr/bin/spyder_win_post_install.py"
}

