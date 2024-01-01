pkgbase=qt-heic-image-plugin
pkgname=(qt5-heic-image-plugin qt6-heic-image-plugin)
pkgver=0.3.1
pkgrel=1
pkgdesc="Qt plug-in to allow Qt and KDE based applications to read/write HEIF/HEIC images."
arch=("x86_64")
url="https://github.com/novomesk/qt-heic-image-plugin"
license=("GPL")
depends=(libheif)
makedepends=(cmake extra-cmake-modules qt5-base qt6-base)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    # Add QT_MAJOR_VERSION to switch between qt versions easily
    "https://github.com/novomesk/qt-heic-image-plugin/pull/4.diff")
sha256sums=('f3e611cecb4918cb17d089e1912451b2ec42cb1f9efc496428b219f78a334cb6'
            '195cb86198fad00a0e7e1500b666ca3591f31740b06447fc4972a2bbf74b7f4a')

prepare() {
    cd qt-heic-image-plugin-$pkgver
    patch -p1 -i "$srcdir/4.diff"
}

build() {
    msg2 "Building QT5 version..."
    cmake -B build-qt5 -S qt-heic-image-plugin-$pkgver \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_MAJOR_VERSION=5
    cmake --build build-qt5

    msg2 "Building QT6 version..."
    cmake -B build-qt6 -S qt-heic-image-plugin-$pkgver \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_MAJOR_VERSION=6
    cmake --build build-qt6
}

package_qt5-heic-image-plugin() {
    depends+=(qt5-base)
    pkgdesc+=" (QT5 version)"
    DESTDIR="$pkgdir" cmake --install build-qt5
}

package_qt6-heic-image-plugin() {
    depends+=(qt6-base)
    pkgdesc+=" (QT6 version)"
    DESTDIR="$pkgdir" cmake --install build-qt6
}
