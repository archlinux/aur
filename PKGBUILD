pkgname=wlc
pkgver=0.0.1
pkgrel=1

pkgdesc='wayland compositor library'
url='https://github.com/Cloudef/wlc'
arch=('i686' 'x86_64')
license=('MIT')

options=('debug' '!strip')

depends=('wayland' 'pixman' 'libxkbcommon' 'libinput' 'libx11' 'libxcb' 'libgl'
         'libdrm' 'mesa' 'xcb-util-image' 'xcb-util-wm')
makedepends=('git' 'cmake')

source=("wlc-${pkgver}.tar.gz::https://github.com/Cloudef/wlc/archive/v${pkgver}.tar.gz"
        'git+https://github.com/Cloudef/chck'
        'git+https://anongit.freedesktop.org/git/wayland/wayland-protocols')

sha512sums=('8f32cc789e9904afc1c7bec6ebd26b65f1c26610d3960ecdf7206e29f802355957cd850823bdffcee7253d67b4511b28e97a52b4d1d1201e63eab6ef40c3052c'
	    'SKIP'
	    'SKIP')

prepare() {
    cd "wlc-${pkgver}"
    rm -rf lib/chck protos/wayland-protocols
    cp -ar "$srcdir"/chck lib/chck
    cp -ar "$srcdir"/wayland-protocols protos/wayland-protocols
}

build() {
    cd "wlc-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSOURCE_WLPROTO=ON
    make
}

check() {
    cd "wlc-${pkgver}"
    make test
}

package() {
    cd "wlc-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
