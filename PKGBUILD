# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=okular-lcd-standalone
_pkgname=okular
pkgver=18.04.1
pkgrel=1
pkgdesc='KDE Document viewer (PDF, Postscript, djvu, etc.) with built-in LCD subpixel rendering support'
arch=(x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(djvulibre libspectre libkexiv2 qca-qt5 kpty kactivities threadweaver kjs kparts purpose)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib discount git qt4
            qt5-base icu gtk2 python2 libjpeg gcc-libs cairo fontconfig openjpeg pkgconfig lcms2 gobject-introspection)
optdepends=('ebook-tools: mobi and epub support' 'discount: markdown support'
            'kdegraphics-mobipocket: mobi support' 'kirigami2: mobile UI' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support')
conflicts=(kdegraphics-okular okular okular-git)
replaces=(kdegraphics-okular okular okular-git)
_commit=ee57925c5779a572b8d5cc52ab59a380bd4b4e03
source=("git+https://github.com/KDE/okular#commit=$_commit"
        "http://poppler.freedesktop.org/poppler-0.43.0.tar.xz"
        01-okular-subpixel-rendering-by-poppler.patch
        02-subpixel-rendering-for-poppler-and-glib.patch
        03-cairo-backend-for-poppler-qt5.patch)
sha256sums=('SKIP'
            'SKIP'
            '4d44bfc0f34a3e26f2d1cc6f5a99cf4199c7a13ae5e1ed57c4b875703328d525'
            '73c0fb71877633cefc37b13bcd7896263dc63b91fe13fa97c2c240292a2bc338'
            'c554b9411764ffcad7a91e22f78a594ca9851e631c70ec15a2b0d52bada0573c')
pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/v//g'
}

build() {
  # patch okular
  cd $srcdir/$_pkgname
  patch -Np1<../01-okular-subpixel-rendering-by-poppler.patch
  #patch poppler
  cd $srcdir/poppler-0.43.0
  patch -Np1<../02-subpixel-rendering-for-poppler-and-glib.patch
  patch -Np1<../03-cairo-backend-for-poppler-qt5.patch
  
  # build poppler (poppler > 0.43 fails to work with LCD subpixel rendering patch)
  cd $srcdir
  mkdir -p pbuild&&cd $_
  cmake ../poppler-0.43.0 \
    -DCMAKE_INSTALL_PREFIX=$srcdir/usr/local \
    -DENABLE_XPDF_HEADERS=ON \
    -DENABLE_LIBOPENJPEG=FALSE \
    -DBUILD_GTK_TESTS=OFF -DBUILD_QT4_TESTS=OFF \
    -DBUILD_QT5_TESTS=OFF -DBUILD_CPP_TESTS=OFF
  make install

  # build okular
  cd $srcdir
  mkdir -p build&&cd $_
  cmake ../$_pkgname \
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
  cp "$srcdir/usr/local/lib/libpoppler-"{qt5-lcd.so.1,lcd.so.60} $libdir
}
