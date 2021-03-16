# Maintainer: Yunxiang Li <shironeko@waifu.club>

pkgname=gnu-poke-git
pkgver=r4210.a5cccc4e
pkgrel=1
pkgdesc="Interactive, extensible editor for binary data."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.jemarch.net/poke.html"
license=('GPL3')
depends=('gc' 'readline' 'gettext' 'json-c')
makedepends=('help2man' 'git')
checkdepends=('dejagnu')
optdepends=()
provides=('poke')
options=('!makeflags')
source=("
    ${pkgname}::git+https://git.savannah.gnu.org/git/poke.git"
    gnulib::git://git.sv.gnu.org/gnulib
    jitter::git+http://git.ageinghacker.net/jitter
    )
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    )

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git submodule init gnulib
    git config submodule.gnulib.url "${srcdir}/gnulib"
    git submodule init jitter
    git config submodule.jitter.url "${srcdir}/jitter"
    git submodule update

    ./bootstrap --skip-po
    mkdir build && cd build
    ../configure --prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"

}

build() {
    cd "${pkgname}/build"

    make
}

check() {
    cd "${pkgname}/build"

    make -k check
}

package() {
    cd "${pkgname}/build"

    make DESTDIR="${pkgdir}/" install
}
