# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt5-color-widgets
_pkgname=Qt-Color-Widgets
pkgver=0.r20.3d577f2
pkgrel=1
pkgdesc='A user-friendly color dialog and several color-related widgets for Qt'
arch=('i686' 'x86_64')
url='https://gitlab.com/mattia.basaglia/Qt-Color-Widgets'
license=('LGPL3')
depends=('qt5-base')
optdepends=('qt5-tools: for QtDesigner integration'
            'qtcreator: for QtCreator integration')
makedepends=('git' 'cmake')
provides=('qt-color-widgets-common')
conflicts=('qt-color-widgets-common')
replaces=('qt5-color-picker')
source=("git+https://gitlab.com/mattia.basaglia/Qt-Color-Widgets.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    mkdir build
    cd build
    cmake ..
    make QtColorWidgetsPlugin
}

package() {
    cd $_pkgname
    install -d "${pkgdir}/usr/include/${_pkgname}"
    mkdir -p "$pkgdir/usr/lib/qt/plugins/designer"
    install -Dvm644 "build/color_widgets_designer_plugin/libQtColorWidgetsPlugin-Qt52.so" "${pkgdir}/usr/lib/qt/plugins/designer/"
    find 'src' -type f -iname '*.hpp' -exec install -Dvm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
    find 'include' -maxdepth 1 -type f -exec install -Dvm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
}
