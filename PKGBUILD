# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=2.0.1
pkgrel=1
pkgsuffix=""
pkgdesc="Quick integration for communication with the Inertial Sense product line."
arch=('any')
url="https://github.com/inertialsense/inertial-sense-sdk"
license=('MIT')
makedepends=('cmake' 'ninja')
depends=('libusb' 'yaml-cpp')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "https://github.com/inertialsense/${pkgname}/archive/refs/tags/${pkgver}${pkgsuffix}.tar.gz"
    01-use-system-libraries.patch
)
sha256sums=(
    'f6da6c2e3c13879d781ac7590b4f0ae8756052d7bb3a041baefb64ad57db36f2'
    'a0437e369076d2df17f7ae98ecfde86d67d5437c3ddec10a596d64662f77896b'
)
options=(
    !strip  # with g++-13, stripping breaks the static library
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}${pkgsuffix}"
    patch --strip=1 < ../01-use-system-libraries.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}${pkgsuffix}"
    cmake . -GNinja -Bbuild
    ninja -C build
    cd cltool
    cmake . -GNinja -Bbuild
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}${pkgsuffix}"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 src/*.h "${pkgdir}/usr/include/inertial-sense-sdk/"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/protocol/"
    install -Dm644 src/protocol/*.h "${pkgdir}/usr/include/inertial-sense-sdk/protocol/"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/util/"
    install -Dm644 src/util/*.h "${pkgdir}/usr/include/inertial-sense-sdk/util/"
    install -Dm644 build/libInertialSenseSDK.a "${pkgdir}/usr/lib/libInertialSenseSDK.a"
    install -Dm755 cltool/build/cltool "${pkgdir}/usr/bin/inertial-sense-cltool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
