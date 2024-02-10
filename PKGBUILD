# Maintainer: BowDown097 <bowdown097 at sneed dot church>

_pkgname=qttube
pkgname=${_pkgname}-git
pkgver=3ecb147
pkgrel=1
pkgdesc="A Qt frontend for YouTube."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/BowDown097/QtTube"
license=('GPL3')
depends=('qt6-base' 'qt6-webchannel' 'qt6-webengine')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('cmake' 'git')
optdepends=('libxss: for preventing the screen from sleeping while watching videos')
source=("git+https://github.com/BowDown097/QtTube"
        "git+https://github.com/BowDown097/innertube-qt"
        "git+https://github.com/woboq/verdigris")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/QtTube"
    git rev-parse --short HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/QtTube"
    git submodule init
    git config submodule.depends/innertube-qt.url "${srcdir}/innertube-qt"
    git -c protocol.file.allow=always submodule update

    cd "${srcdir}/QtTube/lib/innertube-qt"
    git submodule init
    git config submodule.depends/verdigris.url "${srcdir}/verdigris"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "${srcdir}/QtTube" \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DQTTUBE_QT_VERSION_MAJOR="6" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "${srcdir}/QtTube"
    install -Dm644 "program_info/qttube.desktop" "$pkgdir/usr/share/applications/qttube.desktop"
    install -Dm644 "res/qttube.svg" "$pkgdir/usr/share/pixmaps/qttube.svg"
}
