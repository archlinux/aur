pkgname=orbment-git
pkgver=r505.01dcfff
pkgrel=2

pkgdesc='modular wayland compositor based on wlc'
url='https://github.com/Cloudef/orbment'
arch=('i686' 'x86_64')
license=('GPL')

options=('debug' '!strip')

depends=('wlc')
makedepends=('git' 'cmake' 'libpng')
optdepends=('weston: test weston clients in orbment'
            'bemenu: dynamic menu similar to dmenu for launching programs'
            'libpng: PNG screenshot compression')

provides=('orbment')
conflicts=('orbment')

source=('git+https://github.com/Cloudef/orbment'
        'git+https://github.com/Cloudef/chck'
        'git+https://github.com/Cloudef/inihck')

install='orbment-git.install'

sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd orbment
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd orbment
    git submodule init
    git config submodule.chck.url "$srcdir"/chck
    git config submodule.lib/inihck.url "$srcdir"/inihck
    git submodule update lib/chck lib/inihck
}

build() {
    cd orbment
    cmake -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSOURCE_CHCK=ON
    make
}

package() {
    cd orbment
    make DESTDIR="$pkgdir" install
}
