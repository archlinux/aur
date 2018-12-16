# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=fragments-git
pkgver=1.2.r12.gab673a2
pkgrel=1
pkgdesc="A GTK3 BitTorrent client following the GNOME Human Interface Guidelines"
arch=(i686 x86_64 armv6h armv7h)
url="https://gitlab.gnome.org/haecker-felix/Fragments"
license=(GPL3)
depends=(curl
         libb64
         libevent
         libhandy
         libnatpmp
         miniupnpc)
makedepends=(git
             gobject-introspection
             libdazzle
             libhandy
             meson
             vala)
provides=(fragments)
conflicts=(fragments)
source=("git+https://gitlab.gnome.org/haecker-felix/Fragments.git"
        "git+https://github.com/transmission/transmission"
        "git+https://github.com/transmission/dht"
        "git+https://github.com/transmission/libb64"
        "git+https://github.com/transmission/libevent"
        "git+https://github.com/transmission/libnatpmp"
        "git+https://github.com/transmission/libutp"
        "git+https://github.com/transmission/miniupnpc")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd Fragments
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Fragments
    git submodule init
    git config --local submodule.submodules/transmission.url "$srcdir/transmission"
    git submodule update

    cd submodules/transmission
    git submodule init
    git config --local submodule.third-party/dht.url "$srcdir/dht"
    git config --local submodule.third-party/libb64.url "$srcdir/libb64"
    git config --local submodule.third-party/libevent.url "$srcdir/libevent"
    git config --local submodule.third-party/libnatpmp.url "$srcdir/libnatpmp"
    git config --local submodule.third-party/libutp.url "$srcdir/libutp"
    git config --local submodule.third-party/miniupnpc.url "$srcdir/miniupnpc"
    git submodule update
}

build() {
    arch-meson Fragments build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
