# Maintainer: hfte posteo org
pkgname=onewireviewer
pkgver=3.13.40
pkgrel=3
pkgdesc="demonstration application for exploring iButton or 1-Wire® chip features"
arch=('x86_64')
url="https://www.maximintegrated.com/en/products/ibutton/software/1wire/OneWireViewer.cfm"
license=('Custom')
depends=('java-environment' 'libusb-compat')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("https://www.maximintegrated.com/en/design/tools/appnotes/5917/OneWireViewer-Linux.zip")
sha256sums=('fe6dfce35e093a2e36abc4c2a7f612a01b0680bafb662212acd5f9bf1bec27d2')


prepare() {
    cd "OneWireViewer-Linux/OneWireViewer"
    sed -i '4s:.*:ONEWIRELIB=/usr/lib:' run.sh
}


build() {
    cd "OneWireViewer-Linux/PDKAdapterUSB"
    sed -i '5s:.*:CFLAGS = -g -fno-common -fPIC -c -I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux:' Makefile
    make
}


package() {
    DESTDIR="${pkgdir}/usr/lib/${pkgname}"
    mkdir -p "${DESTDIR}"
    cp -r "OneWireViewer-Linux/OneWireViewer" "${DESTDIR}"
    cp -r "OneWireViewer-Linux/onewireapi_java" "${DESTDIR}"
    cp -r "OneWireViewer-Linux/PDKAdapterUSB" "${DESTDIR}"
    chmod +x "${DESTDIR}/OneWireViewer/run.sh"
    cp "${srcdir}/OneWireViewer-Linux/PDKAdapterUSB/libonewireUSB.so" "${pkgdir}/usr/lib"
    cd ${srcdir}/../
    cp "${pkgname}.png" "${DESTDIR}/OneWireViewer"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    cp "99-one-wire.rules" "${pkgdir}/etc/udev/rules.d/"
}
