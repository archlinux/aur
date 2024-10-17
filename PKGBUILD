# Maintainer: Phillip Schichtel <phillip@schich.tel>
pkgname=bookman-cockpit
pkgver=1.16.1
pkgrel=1
options=(!strip)
pkgdesc="Bookman Cockpit"
arch=(any)
url="https://www.bookman.de/"
license=('custom')
depends=('java-environment=21' 'java21-openjfx' 'ttf-liberation')
makedepends=('jdk17-openjdk' 'unzip')
# the bit.ly link looks suspicious, but that's what they use on their website.
# Also the download is not versioned, so this will eventuelly break due to integrity checks failing.
source=("installer-${pkgver}.exe::https://cockpit.bookman-gmbh.de/api/java/update/newest/WINDOWS/file"
        "https://maven.ej-technologies.com/repository/com/install4j/install4j-runtime/9.0.7/install4j-runtime-9.0.7.jar"
        "OperatingSystemUtil.java"
        "logback.xml"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('4630deab6e829b252d816ada0ba2908ad3847d1c0115e0a4e6fad3cc7028de13'
            '5a0bd9ca7d0632eec36d9f3b4980741f70e47511ee070c1da6c7c778ed058106'
            'f2a742dabb4f1ac32867c3ba152355695220e4bd4a7ba032de98e3c5d2ed3309'
            'ef6cf40ff0a46853f2d5308c884e17328a6a36009f5697d5914bfbb720cac261'
            '32db57235ad25fadb8b2a4a02f7618c7a51df33b50df780613f06cb33fb977e3'
            'ea33865658911fcafb54d9898f4823d854bddc9877ba14f59b7534c7eed93970')

build() {
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

    "$JAVA_HOME/bin/javac" -d "$srcdir/classes" "OperatingSystemUtil.java"
    cd "$srcdir"
    unzip -o bookman_windows.exe || [ "$?" = "1" ] || ( echo "Unzip failed!" >&2 && return 1 )
    unzip -op "bin/bookman-${pkgver}.jar" 'icons/bookman.png' > bookman.png
}

package() {
    local optdir="/opt/${pkgname}"
    local target="${pkgdir}${optdir}"

    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "$target/jars"
    cp -a "${srcdir}/bin/lib/." "$target/jars"
    cp -a "${srcdir}/bin/bookman-${pkgver}.jar" "$target/jars"
    cp -a "${srcdir}/install4j-runtime-9.0.7.jar" "$target/jars"

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
