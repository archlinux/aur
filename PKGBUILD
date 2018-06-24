# Maintainer: Niklas <dev@n1klas.net>

pkgname=qt5-mqtt-git
pkgver=5.11.1.r1.gd94d4f9
pkgrel=1
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1"
arch=('i386' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://qt-project.org/"
license=('GPL3' 'custom')
depends=('qt5-base')
makedepends=('git')
provides=('qt5-mqtt')
conflicts=('qt5-mqtt')
source=("gitsrc::git://code.qt.io/qt/qtmqtt.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}"/gitsrc
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "${srcdir}"/build
}

build() {
    cd "${srcdir}"/build

    qmake ../gitsrc
    make
}

package() {
    cd "${srcdir}"/build

    make INSTALL_ROOT="${pkgdir}" install

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}"/usr/lib -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    install -Dm644 "${srcdir}"/gitsrc/LICENSE.GPL3-EXCEPT \
      "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL3-EXCEPT
}
