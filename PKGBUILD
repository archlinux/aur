# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gtk2
pkgname=lib32-$_pkgbasename
pkgver=2.24.33
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) (32-bit)"
arch=('x86_64')
url="https://www.gtk.org/"
install=gtk2.install
depends=(lib32-{'atk>=1.30.0','pango>=1.28.0','cairo>=1.10.0','gdk-pixbuf2>=2.22.1'}
         lib32-lib{'cups>=1.4.4',xcursor,'xrandr>=1.3','xi>=1.3',xinerama,xcomposite,xdamage}
         $_pkgbasename)
makedepends=('python')
license=('LGPL')
source=(https://download.gnome.org/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz
        xid-collision-debug.patch)
sha256sums=('ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558')

prepare() {
  cd "${srcdir}/gtk+-${pkgver}"

  patch -Np1 -i "${srcdir}/xid-collision-debug.patch"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/gtk+-${pkgver}"

  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --with-xinput=yes

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/{include,share}

  cd "${pkgdir}"/usr/bin
  mv gtk-query-immodules-2.0 gtk-query-immodules-2.0-32
  rm -f gtk-builder-convert gtk-demo gtk-update-icon-cache
}
