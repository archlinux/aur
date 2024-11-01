# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Colin Unger <mastakata 3 at yahoo dot com>

_srcname="python-pyvex"
pkgname="${_srcname}-git"
pkgdesc="Python bindings for Valgrind's VEX IR"
url="https://github.com/angr/pyvex"
pkgver=9.2.126.r1135.1add9e2
pkgrel=1
arch=('x86_64')
depends=('glibc' 'python>=3.10' 'python-bitstring' 'python-cffi')
makedepends=('git' 'python-build' 'python-installer' 'python-myst-parser' 'python-setuptools' 'python-sphinx-autodoc-typehints' 'python-wheel')
checkdepends=('python-pytest')
# angr projects all have the same version and mutually support only that
# version. So we provide both, the -git package, for other angr related -git
# packages and the normal package, for packages not requiring a specific version.
provides=($_srcname $pkgname 'libpyvex.so')
conflicts=("${_srcname}")
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/pyvex.git")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # Versions are orphaned branches with tags ...
    version=$(git tag --sort=-version:refname | head -n1 | sed -e 's/v//')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${version}.r${rev_num}.${last_commit}"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --filter=tree:0 --recursive
}

check() {
    cd "${srcdir}/${pkgname}"
    PYTHONPATH=$PWD pytest
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
    make man -C docs
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/pyvex.1 -t "${pkgdir}/usr/share/man/man1"
}
