# Maintainer: hfte posteo org
pkgname=onewireviewer
pkgver=3.13.40
pkgrel=8
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
    # Prepare USB Driver for 1-Wire
    cd "${srcdir}/OneWireViewer-Linux/PDKAdapterUSB"
    # Adjust some paths for java libraries
    sed -i '5s:.*:CFLAGS = -g -fno-common -fPIC -c -I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux:' Makefile

    # Prepare OneWireViewer
    cd "${srcdir}/OneWireViewer-Linux/OneWireViewer"
    # adjust path to USB Driver from /usr/local/lib to /usr/lib:
    sed -i '4s:.*:ONEWIRELIB=/usr/lib:' run.sh
    # Excract the source code
    jar xf OneWireViewersrc.jar
}


build() {
    # Build USB Driver for 1-Wire
    cd "${srcdir}/OneWireViewer-Linux/PDKAdapterUSB"
    make

    # Build OneWireViewer
    cd "${srcdir}/OneWireViewer-Linux/OneWireViewer"
    javac -classpath ../onewireapi_java/OneWireAPI.jar -source 1.4 -encoding ISO-8859-1 -d . src/*.java
    jar cf OneWireViewer.jar *.class images/ 
    rm *.class
}


package() {
    DESTDIR="${pkgdir}/usr/lib/${pkgname}"

    # install OneWire API
    mkdir -p "${DESTDIR}/onewireapi_java"
    cp "OneWireViewer-Linux/onewireapi_java/OneWireAPI.jar" "${DESTDIR}/onewireapi_java"

    # install USB Driver for 1-Wire
    cp "${srcdir}/OneWireViewer-Linux/PDKAdapterUSB/libonewireUSB.so" "${pkgdir}/usr/lib"
    mkdir "${DESTDIR}/PDKAdapterUSB/"
    cp -r "${srcdir}/OneWireViewer-Linux/PDKAdapterUSB/com" "${DESTDIR}/PDKAdapterUSB/"

    # install OneWireViewer
    mkdir -p "${DESTDIR}/OneWireViewer"
    cp "OneWireViewer-Linux/OneWireViewer/OneWireViewer.jar" "${DESTDIR}/OneWireViewer"
    cp "OneWireViewer-Linux/OneWireViewer/run.sh" "${DESTDIR}/OneWireViewer"
    chmod +x "${DESTDIR}/OneWireViewer/run.sh"
    cp "${srcdir}/../${pkgname}.gif" "${DESTDIR}/OneWireViewer"
    cd ${srcdir}/../
    cp "${pkgname}.gif" "${DESTDIR}/OneWireViewer"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/../${pkgname}.desktop" "${pkgdir}/usr/share/applications"

    # install license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp "${srcdir}/../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

    # allow users of group users to use the 1-wire usb-stick
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    cp "${srcdir}/../99-one-wire.rules" "${pkgdir}/etc/udev/rules.d/"
}
