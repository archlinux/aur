# Maintainer: Bernd Schöler <besc@here-be-braces.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>

# The Photivo-to-Gimp GIMP plugin (ptGimp) is not built
# because it became obsolete with GIMP 2.10
# see: https://photivo.org/download/gimp#photivo_to_gimp

pkgname=photivo-git
pkgver=20201119_b821057
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
    cmake -G "Unix Makefiles" -S photivo -B "build-$pkgver" \
          -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cd "build-$pkgver"
    make
}

package() {
    cd "build-$pkgver"
    make DESTDIR="$pkgdir/" install
    cd ..

    # GIMP plugin *Export to Photivo*
    install -Dm 755 \
            "photivo/mm extern photivo.py" \
            "$pkgdir/usr/lib/gimp/2.0/plug-ins/mm-extern-photivo.py"

    # licence because Arch does not provide a *GPL3 only* one
    sed -n '/Photivo is free software/,//p'  "photivo/README" > "build-$pkgver/LICENSE"
    cat "photivo/COPYING" >> "build-$pkgver/LICENSE"
    install -Dm 644 "build-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
