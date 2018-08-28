# $Id: PKGBUILD 210524 2014-04-14 20:07:24Z jgc $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>

pkgname=polkit-git
pkgver=0.115.r7.g42227b5
pkgrel=1
epoch=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(i686 x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd js52)
makedepends=(intltool gtk-doc gobject-introspection git autoconf-archive python-six)
provides=('polkit')
conflicts=('polkit')
options=('!emptydirs')
source=($pkgname::git+http://anongit.freedesktop.org/git/polkit.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --enable-libsystemd-login=yes --disable-static \
      --enable-gtk-doc --with-os-type=redhat

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname
  make -k check || :
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  chmod 0755 "$pkgdir/etc/polkit-1/rules.d"
  chmod 0755 "$pkgdir/usr/share/polkit-1/rules.d"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf" <<END
d /etc/polkit-1/rules.d 0750 root polkitd -
d /usr/share/polkit-1/rules.d 0750 root polkitd -
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim: ts=2 sw=2 et:
