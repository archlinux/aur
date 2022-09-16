# Contributor: Connor Behan  <connor.behan@gmail.com>
pkgname=libwnck-sticky
pkgver=2.31.0
pkgrel=2
pkgdesc="WNCK that shows sticky windows properly in the pager"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.19.7' 'startup-notification>=0.10' 'libxres')
makedepends=('pkg-config' 'libxt>=1.0.6' 'intltool' 'gobject-introspection')
conflicts=("libwnck")
replaces=("libwnck")
provides=("libwnck=$pkgver")
options=('!libtool')
url="https://www.gnome.org/"
source=(https://download.gnome.org/sources/libwnck/2.31/libwnck-${pkgver}.tar.xz WindowActionMenu-unset-window-and-stop-async-events-on-dispose.patch sticky.patch)

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

sha256sums=('83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e'
            'a4a359027f3297847e7d3c9d8cefc6404a927ad6fb5aed864f58524834c60980'
            'f86977f6d452c4f623a6594c7ef9f5f3b90e798806b8869bb0180acf996f7d78')
