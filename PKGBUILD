pkgname=wlc-git
pkgver=r716.d7f7f40
pkgrel=1

pkgdesc='Wayland compositor library.'
url='https://github.com/Cloudef/wlc'
arch=('i686' 'x86_64')
license=('GPL')

depends=('wayland' 'pixman' 'libxkbcommon' 'libinput')
makedepends=('git' 'cmake' 'libx11' 'libxcb' 'libgl')
optdepends=('mesa: For optional platform support (GLESv2, EGL, DRM)'
            'nvidia: For optional platform support (GLESv2, EGL)'
            'libx11: Running the compositor as an Xorg client'
            'libxcb: Running the compositor as an Xorg client')

provides=('wlc')
conflicts=('wlc')

source=('git://github.com/Cloudef/wlc'
        'git://github.com/Cloudef/chck')

md5sums=('SKIP' 'SKIP')

options=('debug' '!strip')

pkgver() {
    cd wlc
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd wlc
    git submodule init
    git config submodule.chck.url "$srcdir"/chck
    git submodule update lib/chck/src
}

build() {
    cd wlc
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
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
