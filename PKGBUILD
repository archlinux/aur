# Maintainer: coldBug <coldBug at e.mail dot de>
pkgname=texstudio-git
pkgver=4.2.2.r88.g8582ee24b
pkgrel=1
pkgdesc="Integrated writing environment for creating LaTeX documents"
arch=('x86_64')
url="https://github.com/texstudio-org/texstudio"
license=('GPL')
depends=('poppler-qt6' 'qt6-svg' 'libxkbcommon-x11' 'hicolor-icon-theme' 'hunspell' 'quazip-qt6'        'desktop-file-utils' 'qt6-declarative' 'qt6-5compat')
makedepends=('git' 'qt6-tools' 'imagemagick' 'librsvg')
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
    qmake6 CONFIG-="debug" USE_SYSTEM_QUAZIP=1 USE_SYSTEM_HUNSPELL=1 QUAZIP_LIB=-lquazip1-qt6 \
        QUAZIP_INCLUDE="/usr/include/QuaZip-Qt6-1.2/quazip" texstudio.pro
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
