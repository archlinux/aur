#
# cidrtools:
# Arch Linux PKGBUILD 
# This builds the latest release tag.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgbase=cidrtools
pkgname=cidrtools 
pkgdesc="Compiled c-library of useful cidr tools plus hostcheck application"

_gitname='cidrtools'

pkgver="1.2.0"
pkgrel=1
url="https://github.com/gene-git/cidrtools"

provides=(libcidrtools.so)
replaces=(hostcheck)

arch=(x86_64)
license=('LGPL-3.0-or-later')

options=(!strip !debug)

depends=(
    glibc
)
optdepends=()

makedepends=(
    gcc
    git
    meson
)
_mkpkg_depends=(
    'gcc>minor'
)

checkdepends=(
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
    # Default cpu-level is x86-64-v3 - if you need to revert to pre 2013 hardware
    # Use : ./scriptes/do-build -cpu_level baseline
    #
    /usr/bin/rm -rf build/*
    export PATH="/usr/bin"
    export CFLAGS=""
    export LDFLAGS=""

    ./scripts/do-build
}

check() {
    cd "${_gitname}"
    echo "***"
    echo "Running test suite:"
    echo "***"
    
    ./scripts/run-tests
}

package() {
    cd "${srcdir}/${_gitname}"
    echo "***"
    echo "Installing: libcidrtools"
    echo "***"

    ./scripts/do-install "$pkgdir"
}

