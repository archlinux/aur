# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gromit-mpx
pkgver=1.7.0
pkgrel=4
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
source=("git+https://github.com/bk138/gromit-mpx.git#tag=${pkgver}")
sha256sums=('4059ffd9e8cc55f65240522fb8aeac743b31b6e47448030e84e02ccc5a4b4d21')

prepare() {
    git -C gromit-mpx submodule init
    git -C gromit-mpx config --local submodule.flatpak/shared-modules.update none
    git -C gromit-mpx -c protocol.file.allow='always' submodule update
}

build() {
    cmake -B build -S gromit-mpx \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING="3.5.0" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
