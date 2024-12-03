# Maintainer: Lance Roy <ldr709@gmail.com>
# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=claripy
_basename=python-$_pyname
pkgname=$_basename-git
pkgdesc="An abstraction layer for constraint solvers."
url="https://github.com/angr/claripy"
pkgver=9.2.131.dev0.r2418.027dda79
pkgrel=1
arch=('any')
depends=(
    'python-cachetools'
    'python-typing_extensions'
    'python-z3-solver'
    'python>=3.10'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-myst-parser'
    'python-setuptools'
    'python-sphinx'
    'python-sphinx-autodoc-typehints'
    'python-wheel'
)
checkdepends=('python-pytest')
provides=($_basename)
conflicts=($_basename)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/claripy.git#branch=master")
b2sums=('SKIP')

prepare() {
    git -C $srcdir/$pkgname clean -dfx
}

pkgver() {
    cd $srcdir/$pkgname

    # Versions are orphaned branches with tags ...
    _version=$(grep -e '^__version__' $_pyname/__init__.py  | cut -f 2 -d '"')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
}

check() {
    cd $srcdir/$pkgname
    PYTHONPATH=build/lib pytest
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    provides+=($_basename=${pkgver%\.r[0-9]*})

    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/_build/man/claripy.1 -t "${pkgdir}/usr/share/man/man1"
}
