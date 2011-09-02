# Maintainer:  Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gtk2
pkgname=lib32-$_pkgbasename
pkgver=2.24.6
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2) (32-bit)"
arch=('x86_64')
url="http://www.gtk.org/"
install=gtk2.install
depends=(lib32-{'atk>=1.30.0','pango>=1.28.0','cairo>=1.10.0','gnutls>=2.8.6','gdk-pixbuf2>=2.22.1'}
         lib32-lib{'cups>=1.4.4',xcursor,'xrandr>=1.3','xi>=1.3',xinerama,xcomposite,xdamage}
         $_pkgbasename)
makedepends=('pkgconfig' 'gcc-multilib')
options=('!libtool' '!docs')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz
        xid-collision-debug.patch
        gtk-modules-32.patch)
sha256sums=('8a026b545dc1fa0c1a69b395232ad7c8ee8fa260be5f7d9a2f2ffcd799efefca'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
            '2effb13404442ae266d4c663347e88cd1ca19e9a83b452da1743bac16af9c7b0')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 -i "${srcdir}/xid-collision-debug.patch"
  patch -p1 -i ${srcdir}/gtk-modules-32.patch

  CXX=/bin/false ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --with-xinput=yes
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
