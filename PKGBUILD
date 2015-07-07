# Maintainer: jtts
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

_pkgbasename=polkit
pkgname=lib32-$_pkgbasename
pkgver=0.112
pkgrel=5
pkgdesc="Application development toolkit for controlling system-wide privileges (32-bit)"
arch=(x86_64)
license=(LGPL)
url="http://www.freedesktop.org/wiki/Software/polkit"
depends=($_pkgbasename lib32-glib2 lib32-pam lib32-expat lib32-systemd lib32-js17)
makedepends=(gcc-multilib intltool git)
# Not needed. This is a lib32-package.
#install=polkit.install
source=("git://anongit.freedesktop.org/polkit#commit=fb5076b7c05d01a532d593a4079a29cf2d63a228")
# Not needed. This is a lib32-package.
#        polkit.pam)
sha256sums=('SKIP')

build() {
  cd $_pkgbasename

  NOCONFIGURE=1 ./autogen.sh

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libdir=/usr/lib32 --libexecdir=/usr/lib32/polkit-1 \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --with-mozjs=mozjs-17.0 --enable-libsystemd-login=yes \
      --disable-static --enable-introspection=no \
      --enable-man-pages=no --disable-gtk-doc \
      CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make
}

package() {
  cd $_pkgbasename
  make DESTDIR="$pkgdir" install

  # Not needed. This is a lib32-package.
  #chown 102 "$pkgdir/etc/polkit-1/rules.d"
  #chown 102 "$pkgdir/usr/share/polkit-1/rules.d"
  #
  #install -m644 "$srcdir/polkit.pam" "$pkgdir/etc/pam.d/polkit-1"

  # cleanup for lib32 package
  rm -rf $pkgdir/{etc,usr/{bin,lib,include,share}}
}
