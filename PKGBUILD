# Maintainer: Danny Bautista <pyrolagus at gmail.com>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-evolution-git
pkgver=3.0.0.r848.c86375e3
pkgrel=1
provides=('logisim-evolution')
conflicts=('logisim-evolution')
pkgdesc='An educational tool for designing and simulating digital logic circuits'
arch=('any')
url="https://github.com/reds-heig/logisim-evolution"
license=('GPL3')
depends=('java-runtime' 'gtk-update-icon-cache' 'desktop-file-utils' 'shared-mime-info')
makedepends=('git' 'java-environment' 'gradle')
install=logisim-evolution.install

source=('git://github.com/reds-heig/logisim-evolution.git#branch=develop'
        logisim-evolution.xml
        logisim-evolution.desktop
        logisim-evolution.sh)
sha256sums=('SKIP'
            'f90c3709748af806a33c14e81c8bf91dc06c3a4f58fe00cfe14a8f1842e09dec'
            '086851b07012f669743080dc4f059cf7727b19200384070852b34e142533385b'
            '35b6b4da515f1c5619d35bbedc1469e5ec5b823bf486efdfbb5b705b65e10656')

pkgver() {
    cd "$srcdir/logisim-evolution"
    printf "3.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/logisim-evolution"

    ./gradlew --no-daemon shadowJar
}

package() {
    cd "$srcdir"
    _appver=$(grep -oP '(?<=^version = ).*$' logisim-evolution/gradle.properties)
    install -Dm644 logisim-evolution/build/libs/logisim-evolution-${_appver}-all.jar \
        "${pkgdir}/usr/share/java/logisim-evolution/logisim-evolution.jar"
    install -Dm644 logisim-evolution.xml \
        "${pkgdir}/usr/share/mime/packages/logisim-evolution.xml"
    install -Dm644 logisim-evolution.desktop \
        "${pkgdir}/usr/share/applications/logisim-evolution.desktop"
    for SIZE in 16 20 24 48 64 128; do
        install -Dm644 logisim-evolution/build/resources/main/resources/logisim/img/logisim-icon-${SIZE}.png \
            "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/logisim-evolution.png"
    done
    install -Dm755 logisim-evolution.sh "${pkgdir}/usr/bin/logisim-evolution"
}
