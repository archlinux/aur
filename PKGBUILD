pkgname=orbment-git
pkgver=r442.f8fbb3c
pkgrel=3

pkgdesc='A modular wayland compositor based on wlc.'
url='https://github.com/Cloudef/orbment'
arch=('i686' 'x86_64')
license=('GPL')

# This dependency should be 'wlc' but AUR helpers aren't capable of figuring
# out that the AUR package 'wlc-git' provides 'wlc'.
depends=('wlc-git')
makedepends=('git' 'cmake' 'libpng')
optdepends=('weston: To test weston clients in orbment.'
            'bemenu: Dynamic menu similar to dmenu for launching programs.'
            'libpng: PNG screenshot compression.')

provides=('orbment')
conflicts=('orbment')

install='orbment-git.install'

source=('git://github.com/Cloudef/orbment'
        'git://github.com/Cloudef/chck'
        'git://github.com/Cloudef/inihck')

md5sums=('SKIP' 'SKIP' 'SKIP')

# Once this software becomes more stable these requirements will be dropped but
# for the time being I recommend leaving them enabled so you may contribute
# useful backtraces to the developer and help remove any errors.
options=('debug' '!strip')

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
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd orbment
    make DESTDIR="$pkgdir" install
}
