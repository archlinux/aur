pkgname=wlc-git
pkgver=r873.faa4d3c
pkgrel=2

pkgdesc='Wayland compositor library'
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
        'git://anongit.freedesktop.org/wayland/wayland-protocols')

sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd wlc
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    cmake -DCMAKE_BUILD_TYPE=Upstream -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
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
