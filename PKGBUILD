# $Id$
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgver=4.12.1
pkgname=${_pkgname}${pkgver%.*}
pkgrel=2
pkgdesc="Legacy (4.12.x) xfconf configuration storage system based on dbus-glib"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
conflicts=("${_pkgname}<4.13.0")
provides=('libxfconf-0.so=2-64')
depends=('libxfce4util' 'dbus-glib')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl'
             'intltool' 'gtk-doc' 'chrpath')
options=('!emptydirs')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('35f48564e5694faa54fdc180cd3268e16fc2352946a89a3c2fc12cbe400ada36')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/opt/${pkgname} \
    --sysconfdir=/opt/${pkgname}/etc \
    --libexecdir=/opt/${pkgname}/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --with-perl-options=INSTALLDIRS="vendor" \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # Fix insecure rpath, http://bugs.archlinux.org/task/19980
  find "$pkgdir" -name Xfconf.so -exec chrpath -d {} +
  
  mkdir -p "${pkgdir}"/usr/lib
  ln -s /opt/${pkgname}/lib/libxfconf-0.so.2.0.0 "${pkgdir}"/usr/lib/libxfconf-0.so.2.0.0
  ln -s /opt/${pkgname}/lib/libxfconf-0.so.2 "${pkgdir}"/usr/lib/libxfconf-0.so.2
}

# vim:set ts=2 sw=2 et:
