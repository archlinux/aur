# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname="netgen"
pkgname="${_pkgname}-lvs"
pkgver=1.5.321
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
b2sums=('d290e2377d5c69dccd9a46715e31e7a93d686f7883190aaf37c9d234d41666e41aeea32c8fa7b698ff90eb83a748266aeb7e8204ed9ba33b3efcc8643034cd22')

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
