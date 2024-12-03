# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: giver <ryan01234keroro56789@gmail.com>

_pyname=angr
_basename=python-$_pyname
pkgname=$_basename-git
pkgver=9.2.131.dev0.r12749.3d2252404
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD-2-Clause')
arch=('x86_64')
depends=(
    'gcc-libs'
    'glibc'
    'python-cachetools'
    'python-capstone'
    'python-cffi'
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
provides=($_basename)
conflicts=($_basename)
source=("$pkgname::git+https://github.com/angr/angr.git")
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
	"python-ailment=${pkgver%\.r[0-9]*}"
	"python-archinfo=${pkgver%\.r[0-9]*}"
	"python-claripy=${pkgver%\.r[0-9]*}"
	"python-cle=${pkgver%\.r[0-9]*}"
	"python-pyvex=${pkgver%\.r[0-9]*}"
    )
    cd $srcdir/$pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 docs/_build/man/angr.1 -t "${pkgdir}/usr/share/man/man1"
}
