# Maintainer: Octavio Calleya Garcia <octavio@transgressoft.net>
pkgname=musicott
pkgver=1.0.0
pkgrel=1
pkgdesc="A JavaFX desktop music player"
arch=('x86_64')
url="https://github.com/octaviospain/Musicott"
license=('GPL3')
depends=('java-runtime>=24' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('liberica-jdk-25-full-bin')
source=("https://github.com/octaviospain/Musicott/archive/v${pkgver}.tar.gz")
sha256sums=('7ce7152f3ae8f9aa67b92cddf5b2667424f82fe5c18a35ba314053932c3ce985')

build() {
    cd "Musicott-${pkgver}"
    # Beryx jlinks the javafx.* jmods into a trimmed runtime, so the build needs a JDK that bundles
    # JavaFX (plain jdk-openjdk has none). Pin JAVA_HOME to the liberica full JDK rather than relying
    # on whatever archlinux-java default is configured.
    export JAVA_HOME=/usr/lib/jvm/liberica-jdk-25-full
    # jpackageImage produces the self-contained app-image at build/jpackage/Musicott/, which package()
    # relocates under /usr/lib/musicott/. The plain `jpackage` task is broken for installerType=app-image
    # on Linux: Beryx forwards --app-image to a `--type app-image` invocation that jpackage rejects with
    # "Option [--app-image] is not valid with type [app-image]".
    ./gradlew --no-daemon jpackageImage -PreleaseVersion="${pkgver}"
}

package() {
    cd "Musicott-${pkgver}"

    # Self-contained app image (bundled JRE + fat jar + launcher) goes under /usr/lib.
    install -dm755 "${pkgdir}/usr/lib/musicott"
    cp -r build/jpackage/Musicott/. "${pkgdir}/usr/lib/musicott/"

    # PATH-accessible launcher (lowercase per Arch convention).
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/musicott/bin/Musicott "${pkgdir}/usr/bin/musicott"

    # Freedesktop integration: .desktop entry + scalable icon.
    install -Dm644 packaging/linux/musicott.desktop "${pkgdir}/usr/share/applications/musicott.desktop"
    # Rewrite Exec=Musicott to Exec=musicott so the .desktop matches the lowercase /usr/bin/musicott symlink.
    # The original Musicott value is correct for AppImage (which uses the jpackage launcher binary directly);
    # for AUR install we route through the symlink.
    sed -i 's|^Exec=Musicott$|Exec=musicott|' "${pkgdir}/usr/share/applications/musicott.desktop"
    install -Dm644 packaging/icons/musicott.png "${pkgdir}/usr/share/pixmaps/musicott.png"

    # License (GPL3 per Musicott's LICENSE file).
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
