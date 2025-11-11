# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=gromit-mpx-git
pkgver=1.8.0.r0.g2ebc0cb
pkgrel=1
pkgdesc='On-screen annotation tool (git version)'
arch=('x86_64')
url='https://github.com/bk138/gromit-mpx/'
license=('GPL-2.0-or-later')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libappindicator-gtk3'
    'libx11'
    'libxi'
    'lz4')
makedepends=(
    'cmake'
    'git')
provides=('gromit-mpx')
conflicts=('gromit-mpx')
backup=('etc/gromit-mpx/gromit-mpx.cfg')
source=('git+https://github.com/bk138/gromit-mpx.git')
sha256sums=('SKIP')

prepare() {
    git -C gromit-mpx submodule init
    git -C gromit-mpx config --local submodule.flatpak/shared-modules.update none
    git -C gromit-mpx -c protocol.file.allow='always' submodule update
}

pkgver() {
    git -C gromit-mpx describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S gromit-mpx \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
