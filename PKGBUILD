# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on work made by Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu-git
_gitname=brisk
pkgver=v0.5.0.r30.gc274131
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment - git version'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja')
optdepends=('mozo: for menu edition'
		'menulibre: for menu edition') 
options=('!libtool' '!emptydirs')
provides=('brisk-menu')
conflicts=('brisk-menu')
source=(git+https://github.com/getsolus/brisk-menu.git
        mate-122.patch)
sha1sums=('SKIP'
          '64641c7c67e357220cab52e48a7518e1d99a04b1')

pkgver() {
    cd "$srcdir/brisk-menu"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "$srcdir/brisk-menu"
    # This patch fixes building with mate 1.22.x
    patch -Np1 -i "${srcdir}/mate-122.patch"
}

build() {
    cd "$srcdir/brisk-menu"
    meson --buildtype plain build --prefix=/usr
    ninja -C build -j$(($(getconf _NPROCESSORS_ONLN)+1))
}


package() {
    cd "$srcdir/brisk-menu"
    DESTDIR="$pkgdir" ninja -C build install
}



