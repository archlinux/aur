# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gtk2
pkgname=lib32-$_pkgbasename
pkgver=2.24.33
pkgrel=3
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) (32-bit)"
arch=('x86_64')
url="https://www.gtk.org/"
install=gtk2.install
depends=(lib32-{atk,pango,cairo,gdk-pixbuf2}
         lib32-lib{cups,xcursor,xrandr,xi,xinerama,xcomposite,xdamage}
         $_pkgbasename)
makedepends=('python' 'glib2-devel')
license=('LGPL')
source=(https://download.gnome.org/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz
        0001-Lower-severity-of-XID-collision-warnings.patch)
sha256sums=('ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da'
            'cbb55e57f06a1439f115d6c6dc4730f70011cc3926deb0ad1b32f2576ee99a0d')

prepare() {
  cd "${srcdir}/gtk+-${pkgver}"

  patch -Np1 -i "${srcdir}/0001-Lower-severity-of-XID-collision-warnings.patch"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  CFLAGS+=" -Wno-error=implicit-int -Wno-error=incompatible-pointer-types"

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
