# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Colin Unger <mastakata 3 at yahoo dot com>

_pyname=archinfo
_basename=python-$_pyname
pkgname=$_basename-git
pkgdesc="Architecture-information specific details for the angr project"
url="https://github.com/angr/archinfo"
pkgver=9.2.131.dev0.r714.74d9945
pkgrel=1
arch=('any')
depends=('python>=3.10')
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
optdepends=(
    'python-capstone: Capstone disassembly support'
    'python-keystone: Keystone assembler support'
    'python-pypcode: Ghidra SLEIGH support'
    'python-pyvex: Valgrind VEX support'
    'python-unicorn: Unicorn engine support'
)
provides=($_basename)
conflicts=($_basename)
license=('BSD-2-Clause')
source=("${pkgname}::git+https://github.com/angr/archinfo.git#branch=master")
b2sums=('SKIP')

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
    install -Dm644 docs/_build/man/archinfo.1 -t "${pkgdir}/usr/share/man/man1"
}
