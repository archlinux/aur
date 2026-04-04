# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname="netgen"
pkgname="${_pkgname}-lvs"
pkgver=1.5.318
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
b2sums=('c311a252204f752daf23c26c7fb375691a62cc8d9f9b4f1f73db049074a900de844a58ddfac84cd534012a0cee91034d83ef151c9921a7a18f62fd1f99fac398')

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
