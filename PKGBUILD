# Maintainer: coldBug <coldBug at e.mail dot de>
pkgname=texstudio-git
pkgver=3.0.1.r45.g9b0ac947
pkgrel=1
pkgdesc="Integrated writing environment for creating LaTeX documents"
arch=('x86_64')
url="https://github.com/texstudio-org/texstudio"
license=('GPL')
depends=('poppler-qt5' 'qt5-svg' 'qt5-script' 'libxkbcommon-x11' 'hicolor-icon-theme' 'hunspell' 'quazip' 'desktop-file-utils')
makedepends=('git' 'qt5-tools' 'imagemagick' 'librsvg')
optdepends=('evince: pdf reader'
            'okular: alternate pdf reader')
replaces=('texmakerx')
conflicts=('texstudio')
source=("git+https://github.com/texstudio-org/texstudio.git")
sha512sums=('SKIP')

pkgver() {
    cd texstudio
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd texstudio
    qmake-qt5 CONFIG-="debug" USE_SYSTEM_QUAZIP=1 USE_SYSTEM_HUNSPELL=1 QUAZIP_LIB=-lquazip1-qt5 \
        QUAZIP_INCLUDE="/usr/include/QuaZip-Qt5-1.1/quazip" texstudio.pro
    make
}

package() {
    cd texstudio
    make INSTALL_ROOT="${pkgdir}" install

    for res in $(/bin/ls /usr/share/icons/hicolor | grep '[0-9]\+x[0-9]\+'); do
        mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${res}/apps
        convert +set date:create +set date:modify -background none -density 1200 -resize ${res} \
            "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/texstudio.svg \
            "${pkgdir}"/usr/share/icons/hicolor/${res}/apps/texstudio.png
    done
}

