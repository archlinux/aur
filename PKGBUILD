# Maintainer: Niklas <dev@n1klas.net>

pkgname=qt5-mqtt
_name=qtmqtt
pkgver=5.12.0
pkgrel=1
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1"
arch=('i386' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://qt-project.org/"
license=('GPL3' 'custom')
depends=('qt5-base')
makedepends=('git')
# All archives from github/code.qt.io do not build properly
source=("git://code.qt.io/qt/qtmqtt.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
    mkdir -p ${srcdir}/build
}

build() {
    cd "${srcdir}"/build

    qmake ../${_name}
    make
}

package() {
    cd "${srcdir}"/build

    make INSTALL_ROOT="${pkgdir}" install

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}"/usr/lib -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    install -Dm644 "${srcdir}"/${_name}/LICENSE.GPL3-EXCEPT \
      "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL3-EXCEPT
}
