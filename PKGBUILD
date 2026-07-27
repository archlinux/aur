#
# pactricia26:
# Arch Linux PKGBUILD 
# This builds the latest release tag.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgbase=patricia26
pkgname=patricia26 
pkgdesc="Updated fork of Dave Plonka's patricia library and dual-tree Python module"

_gitname='patricia26'

pkgver="1.0.0"
pkgrel=1
url="https://github.com/gene-git/patricia26"

provides=(libpatricia26.so)

arch=(x86_64)
license=('LGPL-3.0-or-later' 'UMich-Merit')

options=(!strip !debug)

depends=(
    glibc
    python
)
optdepends=()

makedepends=(
    cython
    gcc
    git
    meson
    meson-python
    uv
    python-pytest
)
_mkpkg_depends=(
    'gcc>minor'
    'cython>minor'
)

checkdepends=(
    python-pytest
)

backup=()

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C <arch@sapience.com>

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

build() {
    cd "${_gitname}"
    echo "***"
    echo "Building:" 
    echo "***"

    #
    # Compile flags are in meson.build - including C23 which is required.
    # -Dcpu_level=baseline
    #
    echo "  C-library"
    /usr/bin/rm -rf build/*
    export PATH="/usr/bin"
    export CFLAGS=""
    export LDFLAGS=""

    /usr/bin/meson setup \
            --reconfigure build/release \
            --prefix=/usr \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --buildtype=release \
            -Ddefault_library=shared \
            -Db_lto=true \
            -Dcpu_level=x86-64-v3

    /usr/bin/meson compile -C build/release

    echo "  Python Module"
    /usr/bin/rm -rf dist/*
    /usr/bin/uv build --wheel
}

check() {
    cd "${_gitname}"
    echo "***"
    echo "Running test suite:"
    echo "***"

    cd ./tests
    ./do-test
}

package() {
    cd "${srcdir}/${_gitname}"
    echo "***"
    echo "Installing: libpatricia26"
    echo "***"

    ./scripts/do-install "$pkgdir"
}

