# Maintainer: Yichao Zhou <broken.zhou@gmail.com>

_pkgname=evince
pkgname=evince-lcdfilter
pkgver=3.20.0
pkgrel=2
pkgdesc="Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))"
url="https://wiki.gnome.org/Apps/Evince"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 libgxps libspectre gsfonts poppler-glib djvulibre t1lib dconf
         libsecret gsettings-desktop-schemas gnome-desktop libarchive
         gst-plugins-base-libs)
makedepends=(itstool libnautilus-extension texlive-bin gobject-introspection
             intltool docbook-xsl python gtk-doc)
optdepends=('texlive-bin: DVI support'
            'gvfs: bookmark support and session saving')
provides=("evince=$pkgver")
conflicts=("evince")
groups=(gnome)
options=('!emptydirs')
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        evince-poppler-subpixel.patch)
sha256sums=('cf8358a453686c2a7f85d245f83fe918c0ce02eb6532339f3e02e31249a5a280'
            'SKIP')

build() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../evince-poppler-subpixel.patch

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
    --disable-schemas-compile \
    --disable-browser-plugin

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
