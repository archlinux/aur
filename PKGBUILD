# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=evince-browser-plugin
pkgver=3.20.0
pkgrel=1
pkgdesc='Document viewer - browser plugin'
url='https://wiki.gnome.org/Apps/Evince'
arch=(i686 x86_64)
license=(GPL)
depends=(evince)
makedepends=(itstool libnautilus-extension texlive-bin intltool gobject-introspection docbook-xsl python)
groups=(gnome)
source=("https://download.gnome.org/sources/evince/${pkgver:0:4}/evince-${pkgver}.tar.xz")
sha256sums=('cf8358a453686c2a7f85d245f83fe918c0ce02eb6532339f3e02e31249a5a280')

build() {
  cd "${srcdir}/evince-${pkgver}"

  ./configure --prefix=/usr   --sysconfdir=/etc \
      --localstatedir=/var    --libexecdir=/usr/lib/evince \
      --disable-static        --enable-nautilus \
      --enable-pdf            --enable-tiff \
      --enable-djvu           --enable-dvi \
      --enable-t1lib          --enable-comics \
      --disable-schemas-compile \
      --enable-introspection
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/evince-${pkgver}"

  make -C browser-plugin DESTDIR="${pkgdir}" install
}
