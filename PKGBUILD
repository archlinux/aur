# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=or-tools-java
pkgver=7.3
pkgrel=2
pkgdesc='Google`s Operations Research tools. With Java bindings.'
arch=('x86_64')
url='https://github.com/google/or-tools'
license=('Apache')
depends=('java-runtime>=7.0')
makedepends=('swig')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha512sums=('a8cc5b3103debe02bb7fbb40c7786a08182b152d6926889c07b1767c7affebe50fc0e658ed9bce41a5e7e21c88fe4d4bb1907b720a9d60a990da059a797b3342')

prepare() {
    cd "${pkgname%-java}-${pkgver}"
    echo "JAVA_HOME = /usr/lib/jvm/default" >> Makefile.local
}

build() {
    cd "${pkgname%-java}-${pkgver}"
    make third_party
    make java
}

check() {
    cd "${pkgname%-java}-${pkgver}"
    make test_java
}

package() {
    cd "${pkgname%-java}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" \
        lib/libjniortools.so \
        lib/libortools.so \
        dependencies/install/lib/libprotobuf-lite.so.3.9.0.0 \
        dependencies/install/lib/libgflags_nothreads.so.2.2.2 \
        dependencies/install/lib/libprotoc.so.3.9.0.0 \
        dependencies/install/lib/libgflags.so.2.2.2 \
        dependencies/install/lib/libglog.so.0.4.0 \
        dependencies/install/lib/libprotobuf.so.3.9.0.0
    for i in ${pkgdir}/usr/lib/${pkgname}/*.so.*; do ln -rs ${i} ${i%so.*}so; done
    install -Dm755 -t "${pkgdir}/usr/share/java/${pkgname}" lib/com.google.ortools.jar
    install -dm 755 "${pkgdir}/usr/share/${pkgname}"
    cp -ar examples/java/* "${pkgdir}/usr/share/${pkgname}"
}
