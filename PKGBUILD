# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=1.8.6
pkgrel=1
pkgdesc="Quick integration for communication with the Inertial Sense product line."
arch=('any')
url="https://github.com/inertialsense/inertial-sense-sdk"
license=('MIT')
makedepends=('cmake' 'ninja')
provides=("${pkgname}")
conflicts=("${pkgname}")
# TODO remove the .d suffix for newer versions that don't need it
pkgver_pub="${pkgver}.d"
source=(
    "https://github.com/inertialsense/${pkgname}/archive/refs/tags/${pkgver_pub}.tar.gz"
)
sha256sums=(
    '68deca1bbe73237f80dd2f2e36cef9a06a270ef24491c545c2461995bdf68b4e'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver_pub}"
    cmake . -GNinja -Bbuild
    ninja -C build cltool InertialSense
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver_pub}"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 src/*.h "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 build/libInertialSense.a "${pkgdir}/usr/lib/libInertialSense.a"
    install -Dm755 build/cltool/cltool "${pkgdir}/usr/bin/inertial-sense-cltool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
