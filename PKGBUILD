# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Colin Unger <mastakata 3 at yahoo dot com>

_srcname=python-cle
pkgname=$_srcname-git
pkgdesc="A binary loader in Python"
url="https://github.com/angr/cle"
pkgver=9.2.123.r1636.ef680fa
pkgrel=1
arch=('any')
depends=(
    "python-archinfo-git"
    "python-claripy-git"
    'python-pefile'
    'python-pyelftools'
    'python-pyvex-git'
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
optdepends=(
    'python-arpy: ar file format'
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
    # 'python-cart:  CaRT file format'
)
# angr projects all have the same version and mutually support only that
# version. So we provide both, the -git package, for other angr related -git
# packages and the normal package, for packages not requiring a specific version.
provides=($_srcname $pkgname)
conflicts=($_srcname)
license=('BSD-2-Clause')
source=("$pkgname::git+https://github.com/angr/cle.git#branch=master")
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
    install -Dm644 docs/_build/man/cle.1 -t "${pkgdir}/usr/share/man/man1"
}
