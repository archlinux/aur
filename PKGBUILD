# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=ailment
_srcname=python-$_pyname
pkgname=$_srcname-git
pkgdesc="angr intermediate language"
url="https://github.com/angr/ailment"
pkgver=9.2.129.dev0.r526.63c9a1c
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
checkdepends=('python-pytest')
provides=($_srcname)
conflicts=($_srcname)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/ailment#branch=master")
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
    PYTHONPATH=:$PWD pytest
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    # All angr projects share the same version. Upstream exclusively supports
    # using projects with the same version number together. Before package()
    # pkgver might be outdated. Thus, run time dependencies on the pkgver are
    # defined here.
    depends+=(
	"python-claripy=${pkgver%\.r[0-9]*}"
	"python-pyvex-git=${pkgver%\.r[0-9]*}"
    )

    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/ailment.1 -t "${pkgdir}/usr/share/man/man1"
}
