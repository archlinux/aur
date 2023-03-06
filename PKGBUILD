# Maintainer: BowDown097 <bowdown097 at sneed dot church>

_pkgname=qttube
pkgname=${_pkgname}-git
pkgver=350fd78
pkgrel=1
pkgdesc="A Qt frontend for YouTube."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/BowDown097/QtTube"
license=('GPL3')
depends=('openssl' 'qt6-base' 'qt6-webchannel' 'qt6-webengine')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
optdepends=('libxss: for preventing the screen from sleeping while watching videos')
source=("git+https://github.com/BowDown097/QtTube"
        "git+https://github.com/BowDown097/innertube-qt")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/QtTube"
    git rev-parse --short HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "QtTube"
    git submodule init
    git config submodule.depends/innertube-qt.url "${srcdir}/innertube-qt"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/QtTube"
    mkdir build
    cd build
    qmake6 ..
    make
}

package() {
    cd "${srcdir}/QtTube"
    cd build
    make INSTALL_ROOT="${pkgdir}" install
    
    cd ..
    install -Dm644 "program_info/qttube.desktop" "$pkgdir/usr/share/applications/qttube.desktop"
    install -Dm644 "res/qttube.svg" "$pkgdir/usr/share/pixmaps/qttube.svg"
}
