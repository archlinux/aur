# Maintainter:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  Ross Whitfield <whitfieldre@ornl.gov>
# Contributor:  Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:  AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:  Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=2.9.0
pkgrel=2
pkgdesc="Open Visualization Tool"
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('boost' 'qscintilla-qt5' 'muparser' 'fftw'
         'openbabel' 'python' 'netcdf')
makedepends=('cmake')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "9.patch")
sha256sums=('8670a5c4fc0199d80e4cf2e96ef1c595c7988bd59fe48e67caebce1713fb1994'
            '154836944fd3ec19411a12e6e6392268406150c186126ff91493500b5ccb6d71')

prepare() {
    cd $srcdir/$pkgname-v$pkgver
    patch -p1 < ../9.patch
    mkdir $srcdir/build
    sed -i "s/ CODEC_FLAG_GLOBAL_HEADER/AV_CODEC_FLAG_GLOBAL_HEADER/g" src/core/utilities/io/video/VideoEncoder.cpp
    sed -i "s/\/resources//g" src/plugins/openbabel/CMakeLists.txt
}

build() {
    cd $srcdir/build
    cmake ../$pkgname-v$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOVITO_BUILD_PLUGIN_OPENBABELPLUGIN=ON \
        -DOPENBABEL_INCLUDE_DIR=/usr/include/openbabel3
    make
}

package() {
    cd $srcdir/build
    make DESTDIR=$pkgdir install
    mv $pkgdir/usr/*.txt $pkgdir/usr/share/$pkgname
}
