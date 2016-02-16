# Maintainer: Thomas Berryhill (oats) <tb01110100@gmail.com>
# Contributor: Earnest

pkgname=orbment-vfs-git
pkgver=r467.ed0746e
pkgrel=2

pkgdesc='A modular wayland compositor based on wlc (feature/vfs branch).'
url='https://github.com/Cloudef/orbment'
arch=('i686' 'x86_64')
license=('GPL')

# This dependency should be 'wlc' but AUR helpers aren't capable of figuring
# out that the AUR package 'wlc-git' provides 'wlc'.
depends=('wlc')
makedepends=('git' 'cmake' 'libpng')
optdepends=('weston: To test weston clients in orbment.'
            'bemenu: Dynamic menu similar to dmenu for launching programs.'
            'libpng: PNG screenshot compression.')

provides=('orbment')
conflicts=('orbment')

install='orbment-git.install'

source=('git://github.com/Cloudef/orbment#branch=feature/vfs'
        'git://github.com/Cloudef/pi9'
        'git://github.com/Cloudef/chck'
        'git://github.com/Cloudef/inihck')

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

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
    git config submodule.lib/pi9.url "$srcdir"/pi9
    git config submodule.lib/inihck.url "$srcdir"/inihck
    git submodule update lib/chck lib/inihck lib/pi9
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

