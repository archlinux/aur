# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=ktgen
pkgver=1.4.0
pkgrel=1
pkgdesc="KTouch Course Generator "
arch=("x86_64")
url="https://github.com/BarbieCue/ktgen"
license=('MIT')
depends=("java-runtime")
makedepends=("gradle")
options=()
source=("https://github.com/BarbieCue/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50a2717f8b8854ac352b442eeb99617073f737dceb5d02418a2c86b709690c3f')


build() {
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    export CLASSPATH=/usr/share/java/${pkgname}
	cd "$pkgname-$pkgver"
    ./gradlew buildFatJar
}

package() {
	cd "$pkgname-$pkgver"
    install -d ${pkgdir}/usr/share/java/${pkgname}
    cp -r ${srcdir}/${pkgname}-${pkgver}/build/* ${pkgdir}/usr/share/java/${pkgname}/

    install -d ${pkgdir}/usr/bin
    cat <<EOT > ${pkgdir}/usr/bin/ktgen
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/${pkgname}/libs/${pkgname}.jar' "\$@"
EOT
    chmod +x ${pkgdir}/usr/bin/ktgen
}
