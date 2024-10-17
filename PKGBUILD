# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: giver <ryan01234keroro56789@gmail.com>

_pyname=angr
pkgname=python-${_pyname}-git
pkgver=9.2.123.r12662.c693201d1
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD-2-Clause')
arch=('x86_64')
depends=(
    'gcc-libs'
    'glibc'
    'python-ailment-git'
    'python-archinfo'
    'python-cachetools'
    'python-capstone'
    'python-cffi'
    'python-claripy-git'
    'python-cle-git'
    'python-cppheaderparser'
    'python-gitpython'
    'python-itanium_demangler'
    'python-matplotlib'
    'python-mulpyplexer'
    'python-nampa'
    'python-networkx'
    'python-protobuf'
    'python-psutil'
    'python-pycparser'
    'python-pyelftools'
    'python-pyformlang'
    'python-pypcode'
    'python-pyvex-git'
    'python-rich'
    'python-sortedcontainers'
    'python-sqlalchemy'
    'python-sympy'
    'python-typing_extensions'
    'python-unicorn'
    'python-unique_log_filter'
    'python>=3.10'

    # Debugging only?
    # opentelemetry
    # No package (yet)
    # pysoot
)
makedepends=(
    'git'
    'make'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-myst-parser'
    'python-sphinx-autodoc-typehints'
)
provides=(${pkgname%%-git})
conflicts=(${pkgname%%-git})
source=("$pkgname::git+https://github.com/angr/angr.git")
b2sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname

    # Versions are orphaned branches with tags ...
    _version=$(git tag --sort=-version:refname | head -n1 | sed -e 's/v//')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
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
    install -Dm644 docs/_build/man/angr.1 -t "${pkgdir}/usr/share/man/man1"
}
