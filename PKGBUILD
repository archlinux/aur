# Contributor: Connor Behan  <connor.behan@gmail.com>
pkgname=libwnck-sticky
pkgver=2.31.0
pkgrel=1
pkgdesc="WNCK that shows sticky windows properly in the pager"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.19.7' 'startup-notification>=0.10' 'libxres')
makedepends=('pkg-config' 'libxt>=1.0.6' 'intltool' 'gobject-introspection' 'python2')
replaces=("libwnck")
provides=("libwnck=$pkgver")
options=('!libtool')
url="http://www.gnome.org/"
source=(http://ftp.gnome.org/pub/gnome/sources/libwnck/2.31/libwnck-${pkgver}.tar.xz WindowActionMenu-unset-window-and-stop-async-events-on-dispose.patch sticky.patch)

build() {
  cd "${srcdir}/libwnck-${pkgver}"
  patch -Np1 -i "${srcdir}"/sticky.patch
  patch -Np1 -i "${srcdir}"/WindowActionMenu-unset-window-and-stop-async-events-on-dispose.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/libwnck-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # These binaries are shipped in libwnck3
  rm -f "${pkgdir}/usr/bin/wnckprop"
  rm -f "${pkgdir}/usr/bin/wnck-urgency-monitor"
  rmdir "${pkgdir}/usr/bin"
}

md5sums=('f03e1139296e2a3a92e3b65a3080cd32'
         'ac358ae8106a71fd267e0bbb6b12b05b'
         '50af9a71f68dd5ade109a30ecbe06c3f')
