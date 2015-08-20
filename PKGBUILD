# Maintainer: jtts
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

_pkgbasename=polkit
pkgname=lib32-$_pkgbasename
pkgver=0.113
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges (32-bit)"
arch=(x86_64)
license=(LGPL)
url="http://www.freedesktop.org/wiki/Software/polkit"
depends=($_pkgbasename lib32-glib2 lib32-pam lib32-expat lib32-systemd lib32-js17)
makedepends=(gcc-multilib intltool git)
# Not needed. This is a lib32-package.
#install=polkit.install
source=(http://www.freedesktop.org/software/$_pkgbasename/releases/$_pkgbasename-$pkgver.tar.gz)
sha256sums=('e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81')

build() {
  cd $_pkgbasename-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libdir=/usr/lib32 --libexecdir=/usr/lib32/polkit-1 \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --with-mozjs=mozjs-17.0 --enable-libsystemd-login=yes \
      --disable-static --enable-introspection=no \
      --enable-man-pages=no --disable-gtk-doc \
      --with-os-type=redhat \
      CC="gcc -m32" CXX="g++ -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make
}

#check() {
#  cd $pkgname-$pkgver
#  make -k check || :
#}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install

  # Not needed. This is a lib32-package.
  #chown 102 "$pkgdir/etc/polkit-1/rules.d"
  #chown 102 "$pkgdir/usr/share/polkit-1/rules.d"

  # cleanup for lib32 package
  rm -rf $pkgdir/{etc,usr/{bin,lib,include,share}}
}
