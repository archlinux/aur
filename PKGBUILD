# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Colin Unger <mastakata 3 at yahoo dot com>

_pyname=cle
_srcname=python-$_pyname
pkgname=$_srcname-git
pkgdesc="A binary loader in Python"
url="https://github.com/angr/cle"
pkgver=9.2.129.dev0.r1646.d73ce74
pkgrel=1
arch=('any')
depends=(
    'python-pefile'
    'python-pyelftools'
    'python-sortedcontainers'
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
    'python-bitstring'
    'python-cffi'
    'python-pytest'
    'python-minidump'
    'python-pyxbe'
    'python-arpy'
    'python-pyaxmlparser'
    'python-cart'
)
optdepends=(
    'python-arpy: ar file format'
    'python-cart:  CaRT file format'
    'python-claripy-git: Symbolic constraints'
    'python-minidump: Microsoft Minidump'
    'python-pyaxmlparser: Android APK'
    'python-pypcode: Disassembly and IR translation using Ghidra SLEIGH'
    'python-pyxbe: XBE (Xbox)'
    'soot: Java Bytecode'
    'uefi-firmware-parser: BIOS/Intel ME/UEFI firmware'

    #  https://aur.archlinux.org/packages/binaryninja-personal#comment-994632
    # 'binaryninja: Binary Ninja'

    #  There are no packages for
    # 'python-pyxdia: Microsoft Program database (PDB)'
)
# angr projects all have the same version and mutually support only that
# version. So we provide both, the -git package, for other angr related -git
# packages and the normal package, for packages not requiring a specific version.
provides=($_srcname)
conflicts=($_srcname)
license=('BSD-2-Clause')
source=(
    "$pkgname::git+https://github.com/angr/cle.git#branch=master"
    "angr-binaries.git::git+https://github.com/angr/binaries.git#branch=master"
    # We cannot (reliably) specify the pkgver in checkdepends, see comment in package()
    "archinfo.git::git+https://github.com/angr/archinfo.git#branch=master"
    "pyvex.git::git+https://github.com/angr/pyvex.git#branch=master"
)
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    git -C $srcdir/$pkgname clean -dfx
    ln -fs angr-binaries.git binaries
}

pkgver() {
    cd $srcdir/$pkgname

    _version=$(grep -e '^__version__' $_pyname/__init__.py  | cut -f 2 -d '"')
    rev_num="$(git rev-list --count HEAD)"
    last_commit="$(git rev-parse --short HEAD)"
    echo "${_version}.r${rev_num}.${last_commit}"
}

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
    make man -C docs
}

check() {
    # build pyvex module
    cd $srcdir/pyvex.git
    git submodule update --init
    python -m build --wheel --no-isolation

    cd $srcdir/$pkgname

    PYTHONPATH="../archinfo.git:../pyvex.git:./build/lib" pytest tests
}

package() {
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
    install -Dm644 docs/_build/man/cle.1 -t "${pkgdir}/usr/share/man/man1"
}
