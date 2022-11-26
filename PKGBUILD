# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=gsim
pkgver=21.3
pkgrel=6
pkgdesc="A tool for visualisation and processing of NMR spectra"
arch=('x86_64')
url="https://sourceforge.net/projects/gsim"
license=('GPL')
depends=('root' 'muparser' 'qt5-svg' 'libcmatrix' 'libemf' 'cblas' 'lapack')
makedepends=('imagemagick')
conflicts=("$pkgname-bin" "$pkgname-git")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgver:0:2}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d3dd161078862fa990b40ff5df988bb82c8469e17dda8e81eda5f1419742de47')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/#CONFIG+=use_opengl/CONFIG+=use_opengl/g" $pkgname.pro
  
  # Fix headers and library directories
  sed -i "/Minuit2\/include/d" $pkgname.pro
  sed -i "/muparser\/include/d" $pkgname.pro
  sed -i "/unix:INCLUDEPATH/c\unix:INCLUDEPATH += \/usr\/include\/libcmatrix \/usr\/include\/root" $pkgname.pro
  sed -i "/unix:LIBS/c\unix:LIBS += -lcmatrix -L\/usr\/lib\/root -lMinuit2 -lmuparser -lEMF -lgomp -lcblas -llapack" $pkgname.pro
  
  # Enable EMF support
  sed -i "s/USE_EMF_OUTPUT/USE_EMF_OUTPUT Q_WS_X11/g" $pkgname.pro
  sed -i "s/toAscii/toUtf8/g" graphics_out.cpp
  
  # A dirty fix for manuals path
  sed -i '/applicationDirPath()/c\    QString s="\/usr\/share\/doc\/gsim\/"+fname;' mainformsignals.cpp
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake QMAKE_CFLAGS_RELEASE="$CFLAGS -march=native" \
        QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS -march=native"
  sed -i "s/isystem /I/g" Makefile*
  make release
  ln -s images/aboutlogo.png 128x128.png
  magick convert 128x128.png -resize 64x64 64x64.png
  magick convert 128x128.png -resize 48x48 48x48.png
  magick convert 128x128.png -resize 32x32 32x32.png
  magick convert 128x128.png -resize 16x16 16x16.png
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/{bin,share/{doc/$pkgname,applications,icons/hicolor/{128x128/apps,64x64/apps,48x48/apps,32x32/apps,16x16/apps}}}
  install -m755 $pkgname "$pkgdir/usr/bin"
  install -m755 README_GSIM.pdf "$pkgdir/usr/share/doc/$pkgname"
  install -m755 quickstart.pdf "$pkgdir/usr/share/doc/$pkgname"
  install -m755 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -m755 64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -m755 48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -m755 32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -m755 16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  cat <<EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=GSim
Exec=$pkgname %f
Type=Application
Categories=Science
Terminal=false
StartupNotify=false
Icon=$pkgname
GenericName=A tool for visualisation and processing of NMR spectra
EOF
}
