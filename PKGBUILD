# Maintainer: Phillip Schichtel <phillip@schich.tel>
pkgname=bookman-cockpit
pkgver=1.13.3
pkgrel=2
options=(!strip)
pkgdesc="Bookman Cockpit"
arch=(any)
url="https://www.bookman.de/"
license=('custom')
depends=('java-environment=21' 'java-openjfx>=21' 'java-openjfx<22')
makedepends=('jdk-openjdk>=21' 'jdk-openjdk<22' 'unzip')
# the bit.ly link looks suspicious, but that's what they use on their website.
# Also the download is not versioned, so this will eventuelly break due to integrity checks failing.
source=("installer-${pkgver}.exe::https://bit.ly/3eMJh3j"
        "https://maven.ej-technologies.com/repository/com/install4j/install4j-runtime/9.0.7/install4j-runtime-9.0.7.jar"
        "https://repo1.maven.org/maven2/com/microsoft/azure/msal4j/1.14.0/msal4j-1.14.0.jar"
        "OperatingSystemUtil.java"
        "logback.xml"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('61395f34e203083e5674c1169e86fb3c224c5998e2088ef80bdb541081eab4e9'
            '5a0bd9ca7d0632eec36d9f3b4980741f70e47511ee070c1da6c7c778ed058106'
            '705cf64a8cc8ca6a35927c7cf39b1844c309735673dbde649106dd6295fabc9a'
            'f2a742dabb4f1ac32867c3ba152355695220e4bd4a7ba032de98e3c5d2ed3309'
            'ef6cf40ff0a46853f2d5308c884e17328a6a36009f5697d5914bfbb720cac261'
            '32db57235ad25fadb8b2a4a02f7618c7a51df33b50df780613f06cb33fb977e3'
            'af96d708f33472671d8accd0729d93c53379ed8360d057208a19f7233bd6be7d')

build() {
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

    "$JAVA_HOME/bin/javac" -d "$srcdir/classes" "OperatingSystemUtil.java"
    unzip -p "bin/bookman-${pkgver}.jar" 'icons/bookman.png' > bookman.png
}

package() {
    local optdir="/opt/${pkgname}"
    local target="${pkgdir}${optdir}"
    local extracted="${srcdir}/jprofiler${pkgver}"

    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "$target/jars"
    cp -a "${srcdir}/bin/lib/." "$target/jars"
    cp -a "${srcdir}/bin/bookman-${pkgver}.jar" "$target/jars"
    cp -a "${srcdir}/install4j-runtime-9.0.7.jar" "$target/jars"
    [ -e "$target/jars/msal4j-1.13.3.jar" ]
    cp -a "${srcdir}/msal4j-1.14.0.jar" "$target/jars/msal4j-1.13.3.jar"

    cp -a "${srcdir}/classes" "$target/override"
    find "$target/override" -type d -exec chown 755 "{}" \;
    find "$target/override" -type f -exec chown 644 "{}" \;
    install -m644 "${srcdir}/logback.xml" "$target/override"

    local icondir="${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "$icondir"
    install -m644 "${srcdir}/bookman.png" "$icondir/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
