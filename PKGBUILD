# Maintainer: Mattia Basaglia <mattia.basaglia@gmail.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt5-color-widgets
pkgver=2.2.0
pkgrel=1
pkgdesc='A user-friendly color dialog and several color-related widgets for Qt'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
groups=('therepoclub')
url="https://gitlab.com/mattbas/Qt-Color-Widgets"
license=('LGPL3')
depends=('qt5-base')
optdepends=('qt5-tools: for QtDesigner integration'
            'qtcreator: for QtCreator integration')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('qt-color-widgets-common')
conflicts=('qt-color-widgets-common')
replaces=('qt5-color-picker')
source=(
	"$pkgname::git+https://gitlab.com/mattbas/Qt-Color-Widgets/#branch=master"
)

sha256sums=('SKIP')

prepare() {
        cd "$pkgname/"

        git submodule update --init --recursive
}


build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make QtColorWidgetsPlugin -j4
}

package() {
    cd "$srcdir/$pkgname/build"
    make install DESTDIR=$pkgdir >/dev/null
    mkdir -p "$pkgdir/usr/lib/qt/plugins/designer"
    install -Dvm644 "color_widgets_designer_plugin/libQtColorWidgetsPlugin-Qt52.so" "${pkgdir}/usr/lib/qt/plugins/designer/"
}
