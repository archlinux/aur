# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gromit-mpx
pkgver=1.7.0
pkgrel=3
pkgdesc='On-screen annotation tool'
arch=('x86_64')
url='https://github.com/bk138/gromit-mpx/'
license=('GPL-2.0-or-later')
depends=(
    'cairo'
    'gdk-pixbuf2'
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
backup=('etc/gromit-mpx/gromit-mpx.cfg')
source=("git+https://github.com/bk138/gromit-mpx.git#tag=${pkgver}"
        '010-gromit-mpx-cmake4-fix.patch')
sha256sums=('4059ffd9e8cc55f65240522fb8aeac743b31b6e47448030e84e02ccc5a4b4d21'
            '5e49e87d23d67604589e69466bc0d1e5081fb85221730931fa6d6c5539d1e135')

prepare() {
    git -C gromit-mpx submodule init
    git -C gromit-mpx config --local submodule.flatpak/shared-modules.update none
    git -C gromit-mpx -c protocol.file.allow='always' submodule update
    
    patch -d gromit-mpx -Np1 -i "${srcdir}/010-gromit-mpx-cmake4-fix.patch"
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
