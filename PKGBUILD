# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
pkgver=26.0.1
pkgrel=1
pkgdesc="Java OpenJFX ${pkgver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL-2.0-only WITH Classpath-exception-2.0')
depends=('java-environment>=24'
         'alsa-lib'
         'at-spi2-core'
         'cairo'
         'ffmpeg'
         'ffmpeg4.4'
         'fontconfig'
         'freetype2'
         'gdk-pixbuf2'
         'glib2'
         'gstreamer'
         'gtk3'
         'libglvnd'
         'libx11'
         'libxtst'
         'libxxf86vm'
         'pango'
         'qt5-base'
         'webkit2gtk-4.1')
provides=("java-openjfx=${pkgver}")
conflicts=('java-openjfx')
options=('!strip' '!debug')
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}-javadoc.zip")
sha256sums=('af7bd9585d14fe6341b0bb6fec1c9c3a93d987c8b8aea4bf97c594714e3d1e31'
            '27f476c4628e14084af79bfef693f534351113bd793043412637dabd32ee35c7'
            'db4e8e28cc6b3f02fa20461ed54bea273c574c327b27340acd8d37e1237d2fad')

_jvmdir=usr/lib/jvm/java-${pkgver}-openjfx

latestver() {
    curl -fsSL https://repo1.maven.org/maven2/org/openjfx/javafx/maven-metadata.xml |
        sed -nE 's:.*<version>([0-9]+(\.[0-9]+)*)</version>.*:\1:p' |
        sort -V |
        tail -1
}

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${pkgver}/lib" "${pkgdir}/${_jvmdir}/"
    # Copy source archive
    cp -a "javafx-sdk-${pkgver}/src.zip" "${pkgdir}/${_jvmdir}/"
    mv "${pkgdir}/${_jvmdir}/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "javafx-sdk-${pkgver}/legal" "${pkgdir}/usr/share/licenses/${pkgname}/"
    # Jmods
    install -d "${pkgdir}/${_jvmdir}/jmods"
    cp -a "javafx-jmods-${pkgver}/"* "${pkgdir}/${_jvmdir}/jmods/"
    # Docs 
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a "javafx-${pkgver}-javadoc/"* "${pkgdir}/usr/share/doc/${pkgname}/"
}
