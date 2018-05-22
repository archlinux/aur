# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=evince-lcd-standalone
_pkgname=evince
pkgver=3.28.2
pkgrel=1
pkgdesc="Document viewer (PDF, Postscript, djvu, etc.) with built-in LCD subpixel rendering support"
url="https://wiki.gnome.org/Apps/Evince"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'libgxps' 'libspectre' 'gsfonts' 'djvulibre' 't1lib' 'dconf'
         'libsecret' 'gsettings-desktop-schemas' 'gnome-desktop' 'libarchive'
         'gst-plugins-base-libs')
makedepends=('itstool' 'libnautilus-extension' 'texlive-bin' 'gobject-introspection'
             'intltool' 'docbook-xsl' 'gtk-doc' 'gnome-common' 'git' 'python'
             'python2' 'libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg' 'gtk2'
             'qt4' 'qt5-base' 'icu' 'pkgconfig' 'lcms2')
optdepends=('texlive-bin: DVI support'
	    'gvfs: bookmark support and session saving')
provides=("evince=$pkgver")
conflicts=('evince' 'evince-lcdfilter')
groups=(gnome)
options=('!emptydirs')
_commit=7fc165add2f0b002b2c7c790671c9a6d1348c3ce #2a4995479ccf65f5bd15df13f9b6c810c3156b58
source=("git+https://git.gnome.org/browse/evince#commit=$_commit"
        "http://poppler.freedesktop.org/poppler-0.43.0.tar.xz"
        01-evince-subpixel-rendering-by-poppler.patch
        02-subpixel-rendering-for-poppler-and-glib.patch
        03-cairo-backend-for-poppler-qt5.patch)
sha256sums=('SKIP'
            'SKIP'
            '65c35d86787021cccee99082ad15cb06e0e865384f9a05aa3523a8aec1229af6'
            '73c0fb71877633cefc37b13bcd7896263dc63b91fe13fa97c2c240292a2bc338'
            'c554b9411764ffcad7a91e22f78a594ca9851e631c70ec15a2b0d52bada0573c')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}


build() {
  #patch poppler
  cd poppler-0.43.0
  patch -Np1<../02-subpixel-rendering-for-poppler-and-glib.patch
  patch -Np1<../03-cairo-backend-for-poppler-qt5.patch
  
  # poppler > 0.43 fails to work with LCD subpixel rendering patch.
  cd $srcdir
  mkdir -p build&&cd $_
  cmake ../poppler-0.43.0 -DENABLE_XPDF_HEADERS=ON -DENABLE_LIBOPENJPEG=FALSE
  make DESTDIR="$srcdir" install
  
  # rename shared libraries to resolve conflicts with existing poppler installation.
  cd $srcdir/usr/local/lib
  rm `find . -type l`
  mv libpoppler-lcd.so.60.0.0 libpoppler-lcd.so.60
  mv libpoppler-glib-lcd.so.8.7.0 libpoppler-glib-lcd.so.8
  
  # patch evince and build
  cd $srcdir/$_pkgname
  patch -Np1<../01-evince-subpixel-rendering-by-poppler.patch
  sed -i 's#$(BACKEND_LIBTOOL_FLAGS)#& -Wl,-rpath -Wl,/usr/lib/evince/poppler-lcd#' ./backend/pdf/Makefile.am

  BROWSER_PLUGIN_DIR=/usr/lib/epiphany/plugins \
  POPPLER_CFLAGS="-I$srcdir/usr/local/include/poppler/glib -I$srcdir/usr/local/include/poppler `pkg-config --cflags glib-2.0 gobject-2.0 cairo libxml-2.0`" \
  POPPLER_LIBS="-L$srcdir/usr/local/lib -l:libpoppler-glib-lcd.so.8 -l:libpoppler-lcd.so.60 `pkg-config --libs glib-2.0 gobject-2.0 cairo libxml-2.0`" \
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname \
    --disable-static \
    --enable-compile-warnings=minimum \
    --enable-introspection \
    --enable-nautilus \
    --enable-pdf \
    --enable-tiff \
    --enable-djvu \
    --enable-dvi \
    --enable-t1lib \
    --enable-comics \
    --enable-gtk-doc \
    --enable-multimedia \
    --disable-schemas-compile

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  libdir=$pkgdir/usr/lib/evince/poppler-lcd
  mkdir -p $libdir
  cp $srcdir/usr/local/lib/{libpoppler-glib-lcd.so.8,libpoppler-lcd.so.60} $libdir
}
