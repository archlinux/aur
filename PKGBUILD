# Maintainer: Yichao Zhou <broken.zhou@gmail.com>

pkgname=evince-lcdfilter
_pkgname=evince
pkgver=3.26.0+14+g2a499547
pkgrel=2
pkgdesc="Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))"
url="https://wiki.gnome.org/Apps/Evince"
arch=(x86_64)
license=(GPL)
depends=(gtk3 libgxps libspectre gsfonts poppler-glib djvulibre t1lib dconf
         libsecret gsettings-desktop-schemas gnome-desktop libarchive
         gst-plugins-base-libs)
makedepends=(itstool libnautilus-extension texlive-bin gobject-introspection
             intltool docbook-xsl python gtk-doc git gnome-common)
optdepends=('texlive-bin: DVI support'
	    'gvfs: bookmark support and session saving')
provides=("evince=$pkgver")
conflicts=("evince")
groups=(gnome)
options=('!emptydirs')
_commit=2a4995479ccf65f5bd15df13f9b6c810c3156b58  # master
source=("git+https://git.gnome.org/browse/evince#commit=$_commit"
        evince-poppler-subpixel.patch)
sha256sums=('SKIP'
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
  cd $_pkgname
  patch -Np1 -i ../evince-poppler-subpixel.patch

  BROWSER_PLUGIN_DIR=/usr/lib/epiphany/plugins \
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

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
