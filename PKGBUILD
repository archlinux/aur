# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname="netgen"
pkgname="${_pkgname}-lvs"
pkgver=1.5.315
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
b2sums=('68056499af78e295e5a614a0679b9444a96aa180df8ca1e8706ae5b45357ba6158cb8be6f67200c30f35f570cc6a4db21ff8fc128b3ed782ab8e79e71cf69b9d')

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
