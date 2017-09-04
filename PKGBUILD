# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.13.4
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'dbus')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl'
             'intltool' 'gtk-doc' 'chrpath')
optdepends=('xfconf4.12: Legacy xfconf libraries')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('4808997894ad9b6bcd39b0e8c609129e60d204c038d4edc4e9b8c55ea2d094c9')
install='xfconf.install'

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
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

  # fix insecure rpath, http://bugs.archlinux.org/task/19980
  find "$pkgdir" -name Xfconf.so -exec chrpath -d {} +
}

# vim:set ts=2 sw=2 et:
