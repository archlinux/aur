# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
# Maintainer: Alex Xu <alex_y_xu dot yahoo at ca>
pkgname=huggle
pkgver=3.4.4
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine')
makedepends=('cmake' 'ninja')
source=("git+https://github.com/huggle/huggle3-qt-lx.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/huggle3-qt-lx"

    # sigh
    git submodule update --init

    # sigh
    (cd src/huggle_core; ./update.sh)
}

build() {
    cd "$srcdir/huggle3-qt-lx/src"

    local cmakeargs=(
        -GNinja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DQT5_BUILD=ON
        -DWEB_ENGINE=ON
        -DBUILD_SHARED_LIBS=OFF
        "$srcdir/huggle3-qt-lx/src"
    )

    cmake "${cmakeargs[@]}"

    ninja
}

package() {
    cd "$srcdir/huggle3-qt-lx/src"
    DESTDIR=$pkgdir ninja install
    find "$pkgdir" -name '*yaml-cpp*' -exec rm -rf {} +
}
