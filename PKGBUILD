# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: Artyom Olshevskiy <siasia@siasia>

pkgname=java-service-wrapper
pkgver=3.5.26
pkgrel=1
pkgdesc="Enables a Java Application to be run as a Windows Service or Unix Daemon"
url="http://wrapper.tanukisoftware.com"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL2')
conflicts=('java-service-wrapper-bin')
makedepends=('apache-ant' 'java-environment>=7')
[[ "$CARCH" = "x86_64" ]] && makedepends+=('cunit' 'classpath')
source=("http://wrapper.tanukisoftware.com/download/${pkgver}/wrapper_${pkgver}_src.tar.gz")
sha256sums=('d891b94149ecd11ba0dc807762873b7b0ee0cbbf997d4f7203ac22b57de82b08')

prepare() {
    sed -i "s:value=\"1.4\":value=\"1.7\":" "${srcdir}/wrapper_${pkgver}_src/build.xml"
}

build() {
    cd "${srcdir}/wrapper_${pkgver}_src"
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh

    [[ "$CARCH" = "x86_64" ]] && _bits=64    || _bits=32
    [[ "$CARCH" = arm*     ]] && _arch=armhf || _arch=x86

    ant -Dbits=${_bits} -Ddist.arch=${_arch} jar compile-c-unix
}

package() {
    cd "${srcdir}/wrapper_${pkgver}_src"
    install -Dm755 bin/wrapper       "${pkgdir}/usr/bin/java-service-wrapper"
    install -Dm644 lib/libwrapper.so "${pkgdir}/usr/lib/java-service-wrapper/libwrapper.so"
    install -Dm644 lib/wrapper.jar   "${pkgdir}/usr/share/java/wrapper-${pkgver}.jar"
    install -Dm644 doc/wrapper-community-license*.txt "${pkgdir}/usr/share/licenses/java-service-wrapper/LICENSE"
    ln -s /usr/share/java/wrapper-${pkgver}.jar "${pkgdir}/usr/share/java/wrapper.jar"
}
