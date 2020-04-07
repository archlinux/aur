# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.15.2
pkgrel=2
pkgdesc="Panel for the Xfce desktop environment"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'garcon' 'libxfce4ui>=4.15.1' 'xfconf' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala0.46>=0.46.7-2' 'python') #for gdbus-codegen
# won't build with vala 0.48: see https://bugzilla.xfce.org/show_bug.cgi?id=16426#c9. Will backport once they commit a working fix.
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('a668b5315268ba5b14b6574edbe00c522f879dea659b75c7742da7140cc3657f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  PKG_CONFIG_PATH="/usr/lib/pkgconfig/vala-0.46/:${PKG_CONFIG_PATH}" \
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
