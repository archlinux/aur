# Maintainer: Bernd Schöler <besc@here-be-braces.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>

# GIMP support is disabled.
# * The old Photivo-to-Gimp GIMP plugin (ptGimp) is not built because it became obsolete with GIMP 2.10.
#   see: https://photivo.org/download/gimp#photivo_to_gimp
# * The Gimp-to-Photivo GIMP plugin (mm-extern-photivo.py) is not installed because Arch builds
#   GIMP without Python scripting support.

# Photivo is built with Qt 6 by default but is still compatible with Qt 5.
# If you need to build with Qt 5, change the version here.
PT_QT_MAJOR_VERSION=6

pkgname=photivo-git
pkgver=20240904_517cc62
pkgrel=1
epoch=1
pkgdesc="Free and open source photo processor"
arch=('x86_64')
url="https://photivo.org/"
license=('GPL-3.0-only')
depends=(
    'exiv2' 'fftw' 'graphicsmagick' 'lcms2' 'lensfun' 'liblqr' 'libjpeg-turbo'
    'libraw' "qt${PT_QT_MAJOR_VERSION}-base"
)
makedepends=('cmake' 'git')
provides=('photivo')
conflicts=('photivo')
source=('git+https://bitbucket.org/Photivo/photivo.git')
md5sums=('SKIP')

pkgver() {
    cd photivo
    git log -1 --format='%cd_%h' --date=short | tr -d -
}

build() {
    cmake \
        -S photivo \
        -B "build-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPT_QT_MAJOR_VERSION=${PT_QT_MAJOR_VERSION} \
        -DWITH_GIMP_TO_PT=OFF

    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build-$pkgver"
}
