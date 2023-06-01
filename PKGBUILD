# Maintainer: coldBug <coldBug at e.mail dot de>
pkgname=texstudio-git
pkgver=4.6.0alpha1.r20.g7fee3f4b7
pkgrel=1
pkgdesc="Integrated writing environment for creating LaTeX documents"
arch=('x86_64')
url="https://github.com/texstudio-org/texstudio"
license=('GPL')
depends=('poppler-qt6' 'qt6-svg' 'libxkbcommon-x11' 'hicolor-icon-theme' 'hunspell' 'quazip-qt6' 'desktop-file-utils' 'qt6-declarative' 'qt6-5compat')
makedepends=('git' 'qt6-tools' 'imagemagick' 'librsvg' 'ninja' 'cmake')
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
    cmake -B build -S texstudio \
            -GNinja \
            -DCMAKE_BUILD_TYPE=None \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install

    for res in $(/bin/ls /usr/share/icons/hicolor | grep '[0-9]\+x[0-9]\+'); do
           mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${res}/apps
           convert +set date:create +set date:modify -background none -density 1200 -resize ${res} \
           "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/texstudio.svg \
           "${pkgdir}"/usr/share/icons/hicolor/${res}/apps/texstudio.png
    done
}
