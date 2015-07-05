# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=fspcc
pkgver=1.8
pkgrel=2
pkgdesc="An FSP compiler and LTS analysis tool"
arch=('any')
url=
license=('GPL3')
groups=()
depends=('bash')
optdepends=('graphviz: visualizing compiled LTS' 'xv: visualizing compiled LTS')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/vmaffione/fspc.git"
_gitname="fspc"

build() {
    # Download the latest netmap code from the public repository
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
        cd "$srcdir/$_gitname"
    fi
    msg "GIT checkout done or server timeout"

    msg "Starting to build fspc"
    cd "$srcdir/$_gitname"
    autoreconf --install
    ./configure || return 1
    make OPTIMIZE=-O2 || return 1 
    msg "Build complete"
}

package() {
    cd "$srcdir/$_gitname/src"
    mkdir -p "$pkgdir/usr/bin"
    cp fspcc "$pkgdir/usr/bin"
    cp ltsee "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"
    cp fspcc.1 "$pkgdir/usr/share/man/man1"
    gzip "$pkgdir/usr/share/man/man1/fspcc.1"
}

# vim:set ts=2 sw=2 et:
