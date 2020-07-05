# Maintainer:   Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  Ross Whitfield <whitfieldre@ornl.gov>
# Contributor:  Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:  AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:  Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.1.1
pkgrel=1
pkgdesc="Open Visualization Tool"
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('boost' 'qscintilla-qt5' 'muparser' 'fftw' 'openbabel' 'python' 'netcdf'
         'ffmpeg')
makedepends=('cmake')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "qwt.patch::https://gitlab.com/stuko/ovito/-/commit/c659ff9f610cd3c0fc786b0075a8ab3c718895de.diff")
sha256sums=('9c29590f038b79c2b8dcd7a46f5d18138ac52a696e2e310f3f8831717bce63f9'
            '5cd22fda001601889cd6dc6529ba38736040179e10c1b04a52147aae7e1d84eb')

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"
    mkdir $srcdir/build
    patch -p1 < ../qwt.patch
}

build() {
    cd "$srcdir/build"
    cmake ../$pkgname-v$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOVITO_BUILD_PLUGIN_OPENBABELPLUGIN=ON \
        -DOPENBABEL_INCLUDE_DIR=/usr/include/openbabel3
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
