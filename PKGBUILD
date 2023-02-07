# Maintainer: Nichlas Severinsen <ns@nsz.no>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Yunxiang Li <shironeko@waifu.club>

pkgname=gnu-poke-git
_gitname=poke
pkgver=r5339.bf7d302e
pkgrel=1
pkgdesc="The GNU extensible binary editor"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.jemarch.net/poke.html"
license=('GPL3')
depends=('gc' 'readline' 'gettext' 'json-c')
makedepends=('help2man' 'git' 'autoconf' 'automake' 'libtool' 'gettext')
checkdepends=('dejagnu')
optdepends=()
conflicts=('poke')
provides=('poke')
options=('!makeflags')
source=(
    "git+https://git.savannah.gnu.org/git/$_gitname.git"
    "git://git.sv.gnu.org/gnulib"
    "git+https://git.ageinghacker.net/jitter"
    )
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    )

pkgver() {
    cd "${srcdir}/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/$_gitname"
    git submodule init
    git config submodule.gnulib.url "${srcdir}/gnulib"
    git config submodule.jitter.url "${srcdir}/jitter"
    git -c protocol.file.allow=always submodule update

    ./bootstrap --skip-po
    mkdir -p build && cd build
    ../configure --prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

build() {
    cd "${srcdir}/$_gitname/build"
    make
}

check() {
    cd "${srcdir}/$_gitname/build"
    make -k check
}

package() {
    cd "${srcdir}/$_gitname/build"
    make DESTDIR="${pkgdir}/" install
    install -Dm644 "${srcdir}/${_gitname}/COPYING" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
