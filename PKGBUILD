pkgname=wlc-git
pkgver=v0.0.1.r25.g1102ef9
pkgrel=1

pkgdesc='wayland compositor library'
url='https://github.com/Cloudef/wlc'
arch=('i686' 'x86_64')
license=('MIT')

options=('debug' '!strip')

depends=('wayland' 'pixman' 'libxkbcommon' 'libinput' 'libx11' 'libxcb' 'libgl'
         'libdrm' 'mesa' 'xcb-util-image' 'xcb-util-wm')
makedepends=('git' 'cmake')

provides=('wlc')
conflicts=('wlc')

source=('git+https://github.com/Cloudef/wlc'
        'git+https://github.com/Cloudef/chck'
        'git+https://anongit.freedesktop.org/git/wayland/wayland-protocols')

sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd wlc
    git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
    cd wlc
    git submodule init
    git config submodule.lib/chck.url "$srcdir"/chck
    git config submodule.protos/wayland-protocols.url "$srcdir"/wayland-protocols
    git submodule update lib/chck protos/wayland-protocols
}

build() {
    cd wlc
    cmake -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSOURCE_WLPROTO=ON
    make
}

check() {
    cd wlc
    make test
}

package() {
    cd wlc
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
