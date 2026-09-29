# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=anymeal-git
_dirname=anymeal
pkgver=1.35.r7.g1629efa
pkgrel=1
pkgdesc="Recipe management software. Supports MealMaster recipes, import, export, search, display, edit, and printing them."
arch=('x86_64')
url="https://github.com/wedesoft/anymeal"
license=('GPL-3.0-or-later')
depends=('sqlite' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'flex' 'gtest'
    'qt6-tools' 'pkgconf')
source=("git+https://github.com/wedesoft/anymeal.git")
provides=("anymeal")
conflicts=("anymeal")
sha256sums=('SKIP')

pkgver() {
    cd "${_dirname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_dirname}"
    ./autogen.sh
}
build() {
    cd "${_dirname}"

    # Ensure Qt6 is used
    export QT_SELECT=6

    # Add Qt6 bin directory to PATH
    export PATH="/usr/lib/qt6:/usr/lib/qt6/bin:$PATH"

    # Set PKG_CONFIG_PATH to include Qt6
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

    # Set environment variables to help configure find Qt6
    export QMAKE="/usr/bin/qmake6"
    export MOC="/usr/bin/moc-qt6"
    export UIC="/usr/bin/uic-qt6"
    export RCC="/usr/bin/rcc-qt6"
    export LRELEASE="/usr/bin/lrelease-qt6"
    export LUPDATE="/usr/bin/lupdate-qt6"

    # Run configure
    ./configure --prefix=/usr CXX="g++ -std=gnu++17"

    make
}

check() {
    cd "${_dirname}"
    make check
}

package() {
    cd "${_dirname}"
    make DESTDIR="$pkgdir/" install
}
