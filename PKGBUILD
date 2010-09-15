# Maintainer:  Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gtk2
pkgname=lib32-$_pkgbasename
pkgver=2.20.1
pkgrel=4
pkgdesc="The GTK+ Toolkit (v2) (32-bit)"
arch=('x86_64')
url="http://www.gtk.org/"
install=gtk2.install
depends=(lib32-{atk,pango,cairo,heimdal,gnutls}
         lib32-lib{tiff,cups,xcursor,xrandr,xi,xinerama,xcomposite,xdamage}
         $_pkgbasename)
makedepends=('gcc-multilib')
options=('!libtool' '!docs')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.20/gtk+-${pkgver}.tar.bz2
        xid-collision-debug.patch
	revert_64bit_fix.patch
        gtk-modules-32.patch)
sha256sums=('0e081731d21e34ff45c82199490c2889504fa8b3c7e117c043e82ababaec0f65'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
	    '20f3a03760f765b68b85b614810e5df4a689b609da1ae200aa30072475121b4c'
            'fac0262cfc26d9e437854fac97bfa2a79f449160ba63963c7282cf160b548fcc')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 -i "${srcdir}/xid-collision-debug.patch"
  patch -RNp1 -i ${srcdir}/revert_64bit_fix.patch
  patch -p1 -i ${srcdir}/gtk-modules-32.patch

  CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libdir=/usr/lib32 \
      --with-xinput=yes \
      --without-libjasper \
      --with-included-loaders=png
  make
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/{include,share}

  cd "${pkgdir}"/usr/bin
  mv gtk-query-immodules-2.0 gtk-query-immodules-2.0-32
  mv gdk-pixbuf-query-loaders gdk-pixbuf-query-loaders-32
  rm -f gdk-pixbuf-csource gtk-builder-convert gtk-demo gtk-update-icon-cache
}
