# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=ailment
_basename=python-$_pyname
pkgname=$_basename-git
pkgdesc="angr intermediate language"
url="https://github.com/angr/ailment"
pkgver=9.2.131.dev0.r533.51551f6
pkgrel=1
arch=('any')
depends=(
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
    'python-cppheaderparser'
    'python-itanium-demangler'
    'python-mulpyplexer'
    'python-nampa'
    'python-networkx'
    'python-pyformlang'
    'python-pytest'
    'python-sympy'
)
provides=($_basename)
conflicts=($_basename)
license=('BSD-2-Clause')
source=(
    "$pkgname::git+https://github.com/angr/ailment#branch=master"
    # We cannot (reliably) specify the pkgver in checkdepends, see comment in package()
    "archinfo.git::git+https://github.com/angr/archinfo.git#branch=master"
    "cle.git::git+https://github.com/angr/cle.git#branch=master"
    "pyvex.git::git+https://github.com/angr/pyvex.git#branch=master"
    "angr.git::git+https://github.com/angr/angr.git#branch=master"
)
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd $srcdir/$pkgname

    _version=$(grep -e '^__version__' $_pyname/__init__.py  | cut -f 2 -d '"')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
}

prepare() {
    git -C $srcdir/$pkgname clean -dfx
}

check() {
    # build pyvex module
    cd $srcdir/pyvex.git
    git submodule update --init
    python -m build --wheel --no-isolation

    cd $srcdir/$pkgname
    PYTHONPATH="../angr.git:../cle.git:../archinfo.git:../pyvex.git/build/lib:./build/lib" pytest tests
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    provides+=($_basename=${pkgver%\.r[0-9]*})

    # All angr projects share the same version. Upstream exclusively supports
    # using projects with the same version number together. Before package()
    # pkgver might be outdated. Thus, run time dependencies on the pkgver are
    # defined here.
    depends+=(
	"python-claripy=${pkgver%\.r[0-9]*}"
	"python-pyvex=${pkgver%\.r[0-9]*}"
    )

    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/ailment.1 -t "${pkgdir}/usr/share/man/man1"
}
