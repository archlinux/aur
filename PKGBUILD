# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=arenatracker
pkgver=22.06
pkgrel=1
pkgdesc="Arena Tracker is a deck tracker that gives you a lot of extra info while playing Hearthstone"
arch=('x86_64')
url="https://github.com/supertriodo/Arena-Tracker"
license=('GPL')
depends=('qt5-base' 'qt5-websockets' 'python-pyautogui' 'libzip' 'opencv2')
makedepends=('imagemagick' 'git')
source=("ArenaTracker-${pkgver}.tar.gz"::"https://github.com/supertriodo/Arena-Tracker/archive/refs/tags/v${pkgver}.tar.gz"
        'ArenaTracker.desktop')
md5sums=('f3604d3493cc683d1c7426fe4348cc36'
         '016d2e7016df6c2f07228ad49c5fb96c')


prepare() {
    cd Arena-Tracker
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir build
}

build() {
    cd Arena-Tracker/build
    qmake \
        PREFIX=/usr \
        QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
        QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
        ../ArenaTracker.pro
    make
    convert ../ArenaTracker.ico ArenaTracker.png
}

package() {
    cd Arena-Tracker
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/share/{applications,pixmaps}
    install -m755 build/ArenaTracker "$pkgdir"/usr/bin/
    install -m644 build/ArenaTracker.png "$pkgdir"/usr/share/pixmaps/
    install -m644 "$srcdir"/ArenaTracker.desktop "$pkgdir"/usr/share/applications/
}
