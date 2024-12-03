# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Colin Unger <mastakata 3 at yahoo dot com>

_pyname=pyvex
_basename=python-$_pyname
pkgname=$_basename-git
pkgdesc="Python bindings for Valgrind's VEX IR"
url="https://github.com/angr/pyvex"
pkgver=9.2.131.dev0.r1145.ea47010
pkgrel=1
arch=('x86_64')
depends=(
    'glibc'
    'python>=3.10'
    'python-bitstring'
    'python-cffi'
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
checkdepends=('python-pytest')
provides=($_basename)
conflicts=($_basename)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/pyvex.git")
b2sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname

    # Versions are orphaned branches with tags ...
    _version=$(grep -e '^__version__' $_pyname/__init__.py  | cut -f 2 -d '"')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
}

prepare() {
    git -C $srcdir/$pkgname clean -dfx

    cd $srcdir/$pkgname
    git submodule update --init --filter=tree:0 --recursive
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
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/pyvex.1 -t "${pkgdir}/usr/share/man/man1"
}
