# Maintainer: Bernd Schöler <besc@here-be-braces.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>

# The Photivo-to-Gimp GIMP plugin (ptGimp) is not built
# because it became obsolete with GIMP 2.10
# see: https://photivo.org/download/gimp#photivo_to_gimp

pkgname=photivo-git
pkgver=20231208_259d0ae
pkgrel=1
epoch=1
pkgdesc="Free and open source photo processor"
arch=('x86_64')
url="https://photivo.org/"
license=('custom:GPL3 only')
depends=(
    'exiv2' 'fftw' 'graphicsmagick' 'lcms2' 'lensfun' 'liblqr'
    'libraw' 'qt5-base' 'shared-mime-info'
)
makedepends=('cmake' 'git')
optdepends=('gimp: Gimp plugins' 'python2: Gimp to Photivo plugin')
provides=('photivo')
conflicts=('photivo')
source=('git+https://bitbucket.org/Photivo/photivo.git')
md5sums=('SKIP')

pkgver() {
    cd photivo
    git log -1 --format='%cd_%h' --date=short | tr -d -
}

build() {
    cmake -S photivo -B "build-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build-$pkgver"

    # licence because Arch does not provide a *GPL3 only* one
    sed -n '/Photivo is free software/,//p'  "photivo/README.md" > "build-$pkgver/LICENSE"
    cat "photivo/COPYING" >> "build-$pkgver/LICENSE"
    install -Dm 644 "build-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
