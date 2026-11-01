# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname="netgen"
pkgname="${_pkgname}-lvs"
pkgver=1.5.327
pkgrel=1
pkgdesc="Layout Vs Schematic (LVS) for comparing SPICE or Verilog netlists"
arch=('x86_64')
url="http://opencircuitdesign.com/netgen/index.html"
_url="https://github.com/RTimothyEdwards/netgen"
license=('GPL-1.0-or-later')
depends=(
    "tcl"
    "tk"
    "python"
    "glibc"
    "bash"
)
makedepends=(
    "git"
    "make"
)
provides=('netgen-lvs')
conflicts=("${pkgname}-git")
source=("${_pkgname}::git+${_url}#tag=${pkgver}")
b2sums=('b573bc26f949ce2ff51d0991dd51bfab9c63600ff650c7b159c69c1c33fda953a6db60c1dd5f27d5d29d54997ded5b2c7139d6213ca6a45acfaba28d0d542304')

build() {
    local custom_cflags=(
        -Wno-unused-result              # Remove warnings
        -Wno-old-style-definition       # Remove warnings
        -Wno-incompatible-pointer-types # Remove warnings
        -std=c17                        # Implicit declarations are in use; need < C24
        -D_DEFAULT_SOURCE               # for 'strcasecmp' and 'isascii'
    )
    CFLAGS+=" ${custom_cflags[*]}"

    cd "${_pkgname}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir/" install
}

# vim: set ts=4 sw=4 et:
