# Maintainer: Octavio Calleya <ogarcia.extern@autofleetcontrol.de>
pkgname=musicott
pkgver=1.0.0
pkgrel=1
pkgdesc="A JavaFX desktop music player"
arch=('x86_64')
url="https://github.com/octaviospain/Musicott"
license=('GPL3')
depends=('java-runtime>=24' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('jdk-openjdk' 'gradle' 'git')
source=("https://github.com/octaviospain/Musicott/archive/v${pkgver}.tar.gz")
sha256sums=('9d611aa6f1e27e3534c16ea8d0259a8302f5db128b54bfa0d43e151a672018b9')

build() {
    cd "Musicott-${pkgver}"
    # Use the system Gradle installed via makedepends; do NOT use ./gradlew per CLAUDE.md global rules.
    # Beryx's jpackage with installerType=app-image produces build/jpackage/Musicott/ — a self-contained
    # directory we relocate under /usr/lib/musicott/ in package().
    gradle --no-daemon jpackage
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
