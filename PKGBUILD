# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
pkgver=26.0.2
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
sha256sums=('8ea7652becace5bf09dab4b855e30381f21fcd3a65a3dac74b69f63c6d175b66'
            '7c32eee96c4f992cea43cecee77420a660478ee2776f0b7475e03fb40cbfae84'
            'c2d3a32303b6b248fe1a2531f33f4edb2d583be9f1e4ac59ff88e1d875d2cb51')

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
