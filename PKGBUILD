pkgname=wlc-git
pkgver=r845.66425fb
pkgrel=1

pkgdesc='Wayland compositor library'
url='https://github.com/Cloudef/wlc'
arch=('i686' 'x86_64')
license=('GPL')

options=('debug' '!strip')

depends=('wayland' 'pixman' 'libxkbcommon' 'libinput' 'libx11' 'libxcb' 'libgl'
         'libdrm' 'mesa' 'xcb-util-image')
makedepends=('git' 'cmake')

provides=('wlc')
conflicts=('wlc')

source=('git+https://github.com/Cloudef/wlc'
        'git+https://github.com/Cloudef/chck')

sha1sums=('SKIP' 'SKIP')

pkgver() {
    cd wlc
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd wlc
    git submodule init
    git config submodule.lib/chck.url "$srcdir"/chck
    git submodule update lib/chck
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
}
