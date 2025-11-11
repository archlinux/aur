# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gromit-mpx
pkgver=1.8.0
pkgrel=1
pkgdesc='On-screen annotation tool'
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
backup=('etc/gromit-mpx/gromit-mpx.cfg')
source=("git+https://github.com/bk138/gromit-mpx.git#tag=${pkgver}")
sha256sums=('c4c6110f45568c7be455a6e6abd84813ef59f6acd04e722d5def415672dbbf59')

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
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
