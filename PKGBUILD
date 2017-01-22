pkgname=wlc-git
pkgver=0.0.7.r22.g12ee978
pkgrel=2

pkgdesc='wayland compositor library'
url='https://github.com/Cloudef/wlc'
arch=('i686' 'x86_64')
license=('MIT')

options=('debug' '!strip')

depends=('wayland' 'pixman' 'libxkbcommon' 'libinput' 'libx11' 'libxcb' 'libgl'
         'libdrm' 'mesa' 'xcb-util-image' 'xcb-util-wm')
makedepends=('git' 'cmake' 'wayland-protocols')

provides=('wlc')
conflicts=('wlc')

source=('git+https://github.com/Cloudef/wlc'
        'git+https://github.com/Cloudef/chck')

sha1sums=('SKIP' 'SKIP')

pkgver() {
    cd wlc
    git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
    cd wlc
    git submodule init
    git config submodule.lib/chck.url "$srcdir"/chck
    git submodule update lib/chck
}

build() {
    cd wlc
    cmake -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
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
