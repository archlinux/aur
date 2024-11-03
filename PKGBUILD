# Maintainer: Lance Roy <ldr709@gmail.com>
# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=claripy
_srcname=python-$_pyname
pkgname=$_srcname-git
pkgdesc="An abstraction layer for constraint solvers."
url="https://github.com/angr/claripy"
pkgver=9.2.126.r2398.8662617b
pkgrel=2
arch=('any')
depends=('python-cachetools' 'python-typing_extensions' 'python-z3-solver' 'python>=3.10')
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
# angr projects all have the same version and mutually support only that
# version. So we provide both, the -git package, for other angr related -git
# packages and the normal package, for packages not requiring a specific version.
provides=($_srcname $pkgname)
conflicts=($_srcname)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/claripy.git#branch=master")
b2sums=('SKIP')

prepare() {
    git -C $srcdir/$pkgname clean -dfx
}

pkgver() {
    cd $srcdir/$pkgname

    # Versions are orphaned branches with tags ...
    version=$(git tag --sort=-version:refname | head -n1 | sed -e 's/v//')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${version}.r${rev_num}.${last_commit}"
}

check() {
    cd $srcdir/$pkgname
    PYTHONPATH=$PWD pytest
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/_build/man/claripy.1 -t "${pkgdir}/usr/share/man/man1"
}
