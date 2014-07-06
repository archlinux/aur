# $Id: PKGBUILD 210524 2014-04-14 20:07:24Z jgc $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>

pkgname=polkit-git
pkgver=0.112.r16.ga68f5df
pkgrel=2
epoch=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(i686 x86_64)
license=(LGPL)
url="http://www.freedesktop.org/wiki/Software/polkit"
depends=(glib2 pam expat systemd js17)
makedepends=(intltool gtk-doc gobject-introspection git)
install=polkit.install
provides=('polkit')
conflicts=('polkit')
source=($pkgname::git+http://anongit.freedesktop.org/git/polkit.git
	polkit.pam)

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/polkit-1 \
      --enable-libsystemd-login=yes --disable-static \
      --enable-gtk-doc --with-mozjs=mozjs-17.0
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  chown 102 "$pkgdir/etc/polkit-1/rules.d"
  chown 102 "$pkgdir/usr/share/polkit-1/rules.d"

  install -m644 "$srcdir/polkit.pam" "$pkgdir/etc/pam.d/polkit-1"
}
md5sums=('SKIP'
	 '6564f95878297b954f0572bc1610dd15')
