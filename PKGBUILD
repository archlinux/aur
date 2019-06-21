# Maintainer: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=3.32.0
pkgrel=1
pkgdesc="GTK3 document viewer, complete features, no gnome dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'gtk3' 'libgxps' 'libspectre' 'poppler-glib' 'djvulibre' 'gsettings-desktop-schemas' 'gspell' 'libarchive' 'gst-plugins-base-libs')
makedepends=('itstool' 'texlive-bin' 'gobject-introspection' 'intltool' 'docbook-xsl' 'python' 'gtk-doc' 'gnome-common' 'appstream-glib')
optdepends=('texlive-bin: DVI support'
            'gvfs: for session saving and bookmarking')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "evince-light")
options=('!emptydirs')
_commit=10da4bcec1cdd535a267e4b8e971668a47f0138b # tags/3.32.0
source=("git+https://gitlab.gnome.org/GNOME/evince.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
cd ${_pkgname}
git describe --tags | sed 's/-/+/g'
}

prepare() {
cd ${_pkgname}
NOCONFIGURE=1 ./autogen.sh
}

build() {
cd ${_pkgname}
BROWSER_PLUGIN_DIR=/usr/lib/epiphany/plugins \

./configure --prefix=/usr \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --libexecdir=/usr/lib/${_pkgname} \
  --disable-static \
  --enable-compile-warnings=minimum \
  --disable-introspection \
  --disable-nautilus \
  --enable-pdf \
  --enable-ps \
  --enable-tiff \
  --enable-djvu \
  --enable-dvi \
  --enable-t1lib \
  --enable-comics \
  --enable-gtk-doc \
  --enable-multimedia \
  --disable-schemas-compile \
  --enable-dbus \
  --without-keyring \
  --disable-libgnome-desktop \
  --disable-browser-plugin

sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

make
}

package() {
cd ${_pkgname}
make DESTDIR="$pkgdir" install
}
