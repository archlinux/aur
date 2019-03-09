# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=texstudio-lcd
_pkgname=texstudio
pkgver=2.12.14
pkgrel=1
pkgdesc="IDE for LaTeX documents with LCD subpixel rendering backend for embedded viewer"
arch=('x86_64')
url="http://texstudio.sourceforge.net/"
license=('GPL')
depends=('qt5-svg' 'qt5-script' 'libxkbcommon-x11' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'mercurial' 'imagemagick' 'librsvg' 'git' 'python' 'icu'
             'python2' 'gobject-introspection' 'qt4' 'qt5-base' 'gtk2' 'lcms2'
             'pkgconfig' 'libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg')
optdepends=('evince-lcd-standalone: pdf reader with LCD subpixel rendering'
            'okular-lcd-standalone: QT pdf reader with LCD subpixel rendering')
conflicts=('texstudio' 'texstudio-dark-git')
replaces=('texmakerx')
_commit=1551ba13b224a38229d1049983ac572710d352cd
source=("git+https://github.com/texstudio-org/texstudio#commit=$_commit"
        "https://poppler.freedesktop.org/poppler-0.43.0.tar.xz"
        01-texstudio-bug-fix.patch
        02-subpixel-rendering-for-poppler-and-glib.patch
        03-cairo-backend-for-poppler-qt5.patch
        04-texstudio-use-poppler-lcd.patch)
sha256sums=('SKIP'
            'SKIP'
            '78e242d233ce68a032d2fab5413e1658b952358d9cae71b7ec470c6adf95c0db'
            '608ecfee2e448b323623993072ae0ab80af0714ff19767eb0dc3a3c413c21279'
            '59e3ff8ea3b7e58a4d9e30a60b848fe8a6534b94025a08074488b747974b5626'
            'b9a9d98009051b741f577b14056149e151710b55fae6d3c12340fd3bfd5ebaf9')

pkgver() {
  cd $_pkgname
  git describe --tags
}

prepare() {
    cd $_pkgname
    patch -Np1 < ../01-texstudio-bug-fix.patch
    patch -Np1 < ../04-texstudio-use-poppler-lcd.patch
    cd $srcdir/poppler-0.43.0
    patch -Np1<../02-subpixel-rendering-for-poppler-and-glib.patch
    patch -Np1<../03-cairo-backend-for-poppler-qt5.patch
}

build() {
    # build poppler (poppler > 0.43 fails to work with LCD subpixel rendering patch)
    cd $srcdir
    mkdir -p build&&cd $_
    cmake ../poppler-0.43.0 \
        -DCMAKE_INSTALL_PREFIX=$srcdir/usr \
        -DENABLE_XPDF_HEADERS=ON \
        -DENABLE_LIBOPENJPEG=FALSE \
        -DBUILD_GTK_TESTS=OFF -DBUILD_QT4_TESTS=OFF \
        -DBUILD_QT5_TESTS=OFF -DBUILD_CPP_TESTS=OFF
    make install
    
    # build texstudio
    cd $srcdir/$_pkgname
    POPPLER_LIB_RPATH=/usr/lib/texstudio/poppler-lcd \
    POPPLER_LIB_DIR=$srcdir/usr/lib \
    qmake-qt5 CONFIG-="debug" texstudio.pro
    sed -i "s#--as-needed#--no-as-needed#g" Makefile
    make
}

package() {
    cd $_pkgname
    make INSTALL_ROOT="${pkgdir}" install
    
    libdir=$pkgdir/usr/lib/texstudio/poppler-lcd
    mkdir -p $libdir
    cp "$srcdir/usr/lib/libpoppler-"{qt5-lcd.so.1,lcd.so.60} $libdir
    
    for res in $(/bin/ls /usr/share/icons/hicolor | grep '[0-9]\+x[0-9]\+'); do
        mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${res}/apps
        convert -background none -density 1200 -resize ${res} \
            "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/texstudio.svg \
            "${pkgdir}"/usr/share/icons/hicolor/${res}/apps/texstudio.png
    done
}
