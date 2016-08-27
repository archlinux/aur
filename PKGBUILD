# Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=hyperion-rpi
_pkgname=hyperion
pkgver=1.03.2
pkgrel=2
pkgdesc="An opensource 'AmbiLight' implementation (build for raspberry pi)"
arch=('arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/hyperion-project/hyperion.ng"
license=('MIT')
depends=('libusb' 'protobuf' 'python' 'qt5-base' 'icu')
optdepends=('xorg-server: X11 grabbing')
makedepends=('cmake')
install="hyperion-rpi.install"
provides=('hyperion')
conflicts=('hyperion')
backup=('etc/hyperion/hyperion.config.json')
source=("https://github.com/tvdzwan/${_pkgname}/archive/${pkgver}.tar.gz"
        "rpi_ws281x::https://github.com/hyperion-project/rpi_ws281x/archive/48d5e1af37fab4970f374d9d98e46bf5ebefa794.zip")
sha512sums=('7406f5bdf323d2799fb375557603fefd1f077cda287b5aa9ff10251b22d8dd07590458515b0e01ef97fba80885aab1aa72bd8b5d26873ad8ebcc1ba53d6776ec'
            '6cc3a41dbb27b7eac6d329606e154c0d53ee686a286a975188a40381dbdbd8e3879abe6a61e69f9c12e176e0895f993568bba558099db440b4fcc7dcb2e03a88')

prepare() {
    # Link ws281x submodule
    rm -r "${srcdir}/${_pkgname}-${pkgver}/dependencies/external/rpi_ws281x"
    ln -s "${srcdir}/rpi_ws281x-48d5e1af37fab4970f374d9d98e46bf5ebefa794" "${srcdir}/${_pkgname}-${pkgver}/dependencies/external/rpi_ws281x"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_QT5=ON \
        -DPLATFORM=rpi-pwm \
        -DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc \
        -DUSE_SYSTEM_PROTO_LIBS=ON \
        ..
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cd build
    make install
    cd ..

    install -Dm 644 config/hyperion.config.json.example \
    "${pkgdir}/etc/hyperion/hyperion.config.json"

    install -Dm 644 bin/service/hyperion.systemd.sh \
    "${pkgdir}/usr/lib/systemd/system/hyperiond.service"

    rm -rf "${pkgdir}/usr/share/hyperion/service"

    install -Dm 644 LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
