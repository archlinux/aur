# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname="netgen"
pkgname="${_pkgname}-lvs"
pkgver=1.5.320
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
b2sums=('0f8d7c63f98b11ae0eda39e3b75ab67df10f1936b82a8097c57eaf57c3b32c8bbb6755dd81df7c6fb8986d276d4d2f460376369b2dfe0506b065709398d894d1')

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
