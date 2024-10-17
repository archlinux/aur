# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=ailment
_srcname=python-$_pyname
pkgname=$_srcname-git
pkgdesc="angr intermediate language"
url="https://github.com/angr/cle"
pkgver=9.2.123.r510.0767b5e
pkgrel=1
arch=('any')
depends=(
    'python-claripy-git'
    'python-pyvex-git'
    'python-pypcode'
    'python>=3.10'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-myst-parser'
    'python-setuptools'
    'python-sphinx-autodoc-typehints'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-archinfo-git'
    'python-pytest-xdist'
)
# angr projects all have the same version and mutually support only that
# version. So we provide both, the -git package, for other angr related -git
# packages and the normal package, for packages not requiring a specific version.
provides=($_srcname $pkgname)
conflicts=($_srcname)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/ailment#branch=master")
b2sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname

    # Versions are orphaned branches with tags ...
    _version=$(git tag --sort=-version:refname | head -n1 | sed -e 's/v//')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
}

check() {
    cd $srcdir/$pkgname
    # TODO
    # Requires python-angr-git
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/ailment.1 -t "${pkgdir}/usr/share/man/man1"
}
