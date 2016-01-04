# Maintainer: Yichao Zhou <broken.zhou@gmail.com>

_pkgname=evince
pkgname=evince-lcdfilter
pkgver=3.18.2
pkgrel=3
pkgdesc="Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))"
url="https://wiki.gnome.org/Apps/Evince"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 libgxps libspectre gsfonts poppler-glib-lcdfilter djvulibre t1lib libsecret desktop-file-utils dconf gsettings-desktop-schemas gnome-desktop libarchive)
makedepends=(itstool libnautilus-extension texlive-bin intltool gobject-introspection docbook-xsl python)
optdepends=('texlive-bin: DVI support'
	    'gvfs: bookmark support and session saving')
provides=("evince=$pkgver")
conflicts=("evince")
groups=(gnome)
install=evince-lcdfilter.install
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        evince-poppler-subpixel.patch)
sha256sums=('42ad6c7354d881a9ecab136ea84ff867acb942605bcfac48b6c12e1c2d8ecb17'
            '4e5494e4a8d8b8a1656224df2e8989f2c6458a484d3b0cf500ba2f748c90e90f')

build() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../evince-poppler-subpixel.patch
  ./configure --prefix=/usr   --sysconfdir=/etc \
      --localstatedir=/var    --libexecdir=/usr/lib/evince \
      --disable-static        --enable-nautilus \
      --enable-pdf            --enable-tiff \
      --enable-djvu           --enable-dvi \
      --enable-t1lib          --enable-comics \
      --disable-scrollkeeper  --disable-schemas-compile \
      --enable-introspection --disable-browser-plugin
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
