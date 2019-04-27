# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=okular-lcd-standalone
_pkgname=okular-$pkgver
pkgver=19.04.0
pkgrel=1
pkgdesc='Document viewer (PDF, Postscript, djvu, etc.) with built-in LCD subpixel rendering'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(djvulibre libspectre libkexiv2 qca kpty kactivities threadweaver kjs kparts purpose discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib discount git qt4
            qt5-base icu gtk2 python2 libjpeg gcc-libs cairo fontconfig pkgconfig lcms2 gobject-introspection)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'kirigami2: mobile UI' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
conflicts=(kdegraphics-okular okular okular-git)
provides=(okular)
replaces=(kdegraphics-okular okular okular-git)
source=("https://download.kde.org/stable/applications/$pkgver/src/okular-$pkgver.tar.xz"
        "https://poppler.freedesktop.org/poppler-0.76.0.tar.xz"
        "git+https://github.com/jonathanffon/poppler-lcd-patch.git"
        01-okular-subpixel-rendering-by-poppler.patch)
sha256sums=('1947b394dfd8da9c7cc4234e308e2476ffa44dc58542d246eafc8397d8991b6e'
            '370f5fcfe2bbf0c76fc394d338cd72ed7f2044b67f4eb4b115eb074ccfc70d63'
            'SKIP'
            '7d9c083519cb6239b8cde57413ec02f6d48afd6c692757fef6feeb9498fcb787')

build() {
  # patch okular
  cd $srcdir/okular-$pkgver
  patch -Np1<../01-okular-subpixel-rendering-by-poppler.patch
  #patch poppler
  cd $srcdir/poppler-0.76.0
  for patch in `ls ../poppler-lcd-patch/*.patch`; do
    patch -p1<$patch
  done
  
  # build poppler 
  cd $srcdir
  mkdir -p pbuild&&cd $_
  cmake ../poppler-0.76.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$srcdir/usr/local \
    -DCMAKE_INSTALL_LIBDIR=$srcdir/usr/local/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DBUILD_GTK_TESTS=OFF -DBUILD_QT4_TESTS=OFF \
    -DBUILD_QT5_TESTS=OFF -DBUILD_CPP_TESTS=OFF
  make install

  # build okular
  cd $srcdir
  mkdir -p build&&cd $_
  cmake ../okular-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DPOPPLER_LIB_DIR=$srcdir/usr/local/lib \
    -DPOPPLER_LIB_RPATH=/usr/lib/qt/plugins/okular/poppler-lcd
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  libdir=$pkgdir/usr/lib/qt/plugins/okular/poppler-lcd
  mkdir -p $libdir
  cp "$srcdir/usr/local/lib/libpoppler"{-qt5.so.1,.so.87} $libdir
}
