# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
# Maintainer: Alex Xu <alex_y_xu dot yahoo at ca>
pkgname=huggle
pkgver=3.3.5
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine')
makedepends=('cmake' 'ninja' 'unzip')
groups=('base-devel')
source=("git+https://github.com/huggle/huggle3-qt-lx.git#tag=3.3.5")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/huggle3-qt-lx"

    # sigh
    git submodule update --init
}

build() {
    cd "$srcdir/huggle3-qt-lx/huggle"

    cmakeargs=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DQT5_BUILD=true
        -DWEB_ENGINE=true
        -DBUILD_SHARED_LIBS=false .
    )

    cmake -GNinja "${cmakeargs[@]}"

    ninja
}

package() {
    cd "$srcdir/huggle3-qt-lx/huggle"
    DESTDIR=$pkgdir ninja install
    find $pkgdir -name '*yaml-cpp*' -exec rm -rf {} +
}
