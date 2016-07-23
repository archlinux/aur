# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=aqsis
pkgver=1.8.2
pkgrel=4
pkgdesc="A high quality, photorealistic, 3D rendering solution"
arch=('i686' 'x86_64')
url="http://www.aqsis.org"
license=('GPL2')
optdepends=('qt4: graphical interface' 'libgl: ptview')
depends=('boost-libs' 'openexr' 'hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils')
makedepends=('cmake' 'boost' 'openexr' 'libpng' 'qt4' 'mesa')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/aqsis/aqsis-source/$pkgver/$pkgname-$pkgver.tar.gz"
        "pfto.patch"
        "imfinputfile-forward-declaration.diff"
        "shadowmap_old.patch")
md5sums=('399967e99f12cfbd1a7385c4e1d39c3b'
         '908487f2e7b495b100dfa6b3aa8945ae'
         'e52f27d3041e88a63531b691ad05a6aa'
         '9c490fa421b1c8b345741f06f7321b37')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  # fix build with OpenEXR 2.0 (?)
  patch -Np1 < "$srcdir/imfinputfile-forward-declaration.diff" || true
  # fix build with boost 1.59
  patch -Np1 < "$srcdir/pfto.patch"
  # fix build for stricter iostream interface
  patch -Np1 < "$srcdir/shadowmap_old.patch"
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$srcdir"/$pkgname-build
  cd "$srcdir"/$pkgname-build

  cmake "$srcdir"/$pkgname-$pkgver \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc/aqsis
  make
}

package() {
  cd "$srcdir"/$pkgname-build
  make DESTDIR="$pkgdir" install
}
