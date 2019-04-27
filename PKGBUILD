# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgname=evince-lcd-standalone
_pkgname=evince
pkgver=3.32.0
pkgrel=1
pkgdesc="Document viewer (PDF, Postscript, djvu, etc.) with built-in LCD subpixel rendering"
url="https://wiki.gnome.org/Apps/Evince"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'libgxps' 'libspectre' 'gsfonts' 'djvulibre' 't1lib' 'dconf'
         'libsecret' 'gsettings-desktop-schemas' 'gnome-desktop' 'libarchive'
         'gst-plugins-base-libs' 'gspell' 'libsynctex')
makedepends=('itstool' 'libnautilus-extension' 'texlive-bin' 'gobject-introspection'
             'intltool' 'docbook-xsl' 'gtk-doc' 'gnome-common' 'git' 'python'
             'python2' 'libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'gtk2'
             'qt4' 'qt5-base' 'icu' 'pkgconfig' 'lcms2')
optdepends=('texlive-bin: DVI support'
	    'gvfs: bookmark support and session saving')
provides=("evince=$pkgver")
conflicts=('evince' 'evince-lcdfilter')
groups=(gnome)
options=('!emptydirs')
_commit=10da4bcec1cdd535a267e4b8e971668a47f0138b  # tags/3.32.0^0
source=("git+https://gitlab.gnome.org/GNOME/evince.git#commit=$_commit"
        "https://poppler.freedesktop.org/poppler-0.76.0.tar.xz"
        "git+https://github.com/jonathanffon/poppler-lcd-patch.git")
sha256sums=('SKIP'
            '370f5fcfe2bbf0c76fc394d338cd72ed7f2044b67f4eb4b115eb074ccfc70d63'
            'SKIP')

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
  
  # Build evince with subpixel patched poppler-0.76
  cd $srcdir/$_pkgname
  sed -i 's#$(BACKEND_LIBTOOL_FLAGS)#& -Wl,-rpath -Wl,/usr/lib/evince/poppler-lcd#' ./backend/pdf/Makefile.am

  BROWSER_PLUGIN_DIR=/usr/lib/epiphany/plugins \
  POPPLER_CFLAGS="-I$srcdir/usr/local/include/poppler/glib -I$srcdir/usr/local/include/poppler `pkg-config --cflags glib-2.0 gobject-2.0 cairo libxml-2.0`" \
  POPPLER_LIBS="-L$srcdir/usr/local/lib -l:libpoppler-glib.so.8 -l:libpoppler.so.87 `pkg-config --libs glib-2.0 gobject-2.0 cairo libxml-2.0`" \
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
  cp "$srcdir/usr/local/lib/libpoppler"{-glib.so.8,.so.87} $libdir
}
