# Maintainer: Dr-Incognito <v2ray.dev at gmail dot com>
pkgname=v2ray-desktop
pkgver=1.4.0
pkgrel=1
pkgdesc="A Cross-platform GUI Client for V2Ray written in Qt 5 and QML 2 (Stable Release)"
arch=("x86_64")
url="https://github.com/Dr-Incognito/V2Ray-Desktop"
license=("GPL3")
depends=("v2ray" "qt5-base>=5.14.0" "qt5-quickcontrols>=5.14.0" "qt5-quickcontrols2>=5.14.0")
makedepends=("git" "make" "qt5-tools>=5.14.0" which gcc "qt5-declarative>=5.14.0")
provides=(v2ray-desktop)
source=("V2Ray-Desktop::git+${url}#tag=${pkgver}")
sha512sums=("SKIP")

prepare() {
    cd "${srcdir}/V2Ray-Desktop"
    echo "Initialize submodules. This may take a long time ..."
    git submodule init
    git submodule update
}

build() {
    cd "${srcdir}/V2Ray-Desktop"
    sed -i "s/\"v2ray-core\"/\"\/usr\/bin\"/" src/constants.h
    sed -i "s/Exec=%1/Exec=\/usr\/bin\/v2ray-desktop/" src/misc/tpl-linux-autostart.desktop
    sed -i "s/Icon=/Icon=\/usr\/share\/icons\/hicolor\/256x256\/apps\//" src/misc/tpl-linux-autostart.desktop
    mkdir -p build && cd build
    qmake PREFIX=/usr ../src
    make -j$nproc
}

package() {
    cd "${srcdir}/V2Ray-Desktop"
    install -Dm755 build/V2Ray-Desktop "${pkgdir}/usr/bin/v2ray-desktop"
    install -Dm644 src/misc/tpl-linux-autostart.desktop "${pkgdir}/usr/share/applications/v2ray-desktop.desktop"
    install -Dm644 src/images/v2ray.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/v2ray-desktop.png"
}