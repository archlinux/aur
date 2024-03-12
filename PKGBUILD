# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gromit-mpx
pkgver=1.6.0
pkgrel=1
pkgdesc='On-screen annotation tool'
arch=('x86_64')
url='https://github.com/bk138/gromit-mpx/'
license=('GPL-2.0-or-later')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libappindicator-gtk3' 'libx11' 'libxi'
         'hicolor-icon-theme')
makedepends=('git' 'cmake')
backup=('etc/gromit-mpx/gromit-mpx.cfg')
source=("git+https://github.com/bk138/gromit-mpx.git#tag=${pkgver}"
        'flatpak-shared-modules'::'git+https://github.com/flathub/shared-modules.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    git -C gromit-mpx submodule init
    git -C gromit-mpx config --local submodule.flatpak/shared-modules.url "${srcdir}/flatpak-shared-modules"
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
