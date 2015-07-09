# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jan de Groot <jgc@archlinux.org>

_p=evince
pkgname=evince2
pkgver=2.32.0
pkgrel=3
pkgdesc="Simply a document viewer. Gtk2 version."
url="http://projects.gnome.org/evince/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'libspectre>=0.2.6' 'gsfonts' 'poppler-glib>=0.16.2' 'libdjvu>=3.5.22'
         'gnome-icon-theme>=2.31.0' 't1lib' 'desktop-file-utils' 'dconf' 'gconf')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection' 'gtk-doc' 'gnome-common')
provides=("$_p=$pkgver")
install="$pkgname.install"
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/$_p/2.32/$_p-$pkgver.tar.bz2"
        "update_to_poppler_api.patch"
        "security_issues_in_dvi-backend.patch"
	"fixups.patch")
sha256sums=('2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7'
            '2990c789c8cfd50e46f4dfa7a2406499b3ee26f4db9840c8b9a6e1dee40f61f4'
            '49d1ed8adc734a005d4d8fdc1912bb115d97f734071d64bcae0aae60f2b5626a'
            '4cd393d57a0587eeb11f9efd4c5099d3fc0078f2566729f002165db4aae40891')

build() {
  cd "$srcdir/$_p-$pkgver"

  # THIS DOES NOT CONFLICT WITH EVINCE IN [EXTRA]

  # patches
  patch -Np1 -b -z .orig -i "$srcdir/update_to_poppler_api.patch"
  patch -Np1 -b -z .orig -i "$srcdir/security_issues_in_dvi-backend.patch"
  patch -Np2 -b -z .orig -i "$srcdir/fixups.patch"

  # rename all to [eE]vince2 to prevent conflicts with evince gtk3
  _f=`find . -name "*[eE]vince*"`
  for _l in $_f; do
    mv $_l `echo $_l | sed "s|\([eE]\)\(vince2\{0,1\}\)|\1vince2|g"`
  done
  sed -i "s|\([eE]\)\(vince2\{0,1\}\)|\1vince2|g" `grep -rl "[eE]vince" .`

  # DSO link fix
  export LIBS=" -lICE"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname \
    --disable-static \
    --disable-nautilus \
    --enable-pdf \
    --enable-tiff \
    --enable-djvu \
    --disable-dvi \
    --enable-t1lib \
    --enable-pixbuf \
    --enable-comics \
    --enable-impress \
    --enable-introspection \
    --disable-scrollkeeper \
    --disable-schemas-compile \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --without-keyring \
    --with-gconf
  make
}

package() {
  cd "$srcdir/$_p-$pkgver"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  # gconf
  install -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    --domain $pkgname "$pkgdir"/usr/share/gconf/schemas/*.schemas
  rm -f "$pkgdir"/usr/share/gconf/schemas/$pkgname-*
}
