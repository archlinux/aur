# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools-java
pkgver=7.3
pkgrel=1
pkgdesc='Google`s Operations Research tools. With Java bindings.'
arch=('x86_64')
url='https://github.com/google/or-tools'
license=('Apache')
depends=('java-runtime>=7.0')
makedepends=('swig')
conflicts=('python-or-tools' 'or-tools') # because it copies libortools.so to usr/lib
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha512sums=('a8cc5b3103debe02bb7fbb40c7786a08182b152d6926889c07b1767c7affebe50fc0e658ed9bce41a5e7e21c88fe4d4bb1907b720a9d60a990da059a797b3342')

build() {
    cd "${pkgname%-java}-${pkgver}"
    JAVA_HOME="/usr/lib/jvm/default" make third_party
    make java
}

check() {
    cd "${pkgname%-java}-${pkgver}"
    JAVA_HOME="/usr/lib/jvm/default" make test_java
}

package() {
    cd "${pkgname%-java}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/lib" lib/libjniortools.so lib/libortools.so
    install -Dm755 -t "${pkgdir}/usr/share/java/${pkgname}" lib/com.google.ortools.jar
    install -dm 755 "${pkgdir}/usr/share/${pkgname}"
    cp -ar examples/java/* "${pkgdir}/usr/share/${pkgname}"
}
