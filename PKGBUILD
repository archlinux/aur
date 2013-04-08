# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-better-smartplacement
pkgver=4.10.0
pkgrel=1
pkgdesc="Xfce window manager w/ better smart placement of new windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=('xfwm4=4.10.0')
conflicts=('xfwm4')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.10/${_pkgname}-${pkgver}.tar.bz2
        0001-Rewrote-smartPlacement.patch
        xfwm4-4.10.0-implement-NET_WM_MOVERESIZE_CANCEL.patch)
sha1sums=('1549954949b5e1f38a2279a39a477b52bb5339f2'
          'a7894fd9fb0edc7b4c0149e5c6c3eb085483cff3'
          '32dd678f8477a5b30d17641a0d75c5a54c4dca52')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 -i ../0001-Rewrote-smartPlacement.patch
  # fixes https://bugzilla.xfce.org/show_bug.cgi?id=8949
  patch -Np1 -i ../xfwm4-4.10.0-implement-NET_WM_MOVERESIZE_CANCEL.patch
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --disable-static \
      --enable-startup-notification \
      --enable-randr \
      --enable-compositor \
      --enable-xsync \
      --disable-debug
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
