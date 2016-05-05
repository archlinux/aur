# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: dale <dale@archlinux.org>
# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=gtetrinet
pkgver=0.7.11
pkgrel=5
pkgdesc="A clone of the game Tetrinet for the gnome environment"
url="http://gtetrinet.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libgnomeui>=2.18.1-2' 'desktop-file-utils' 'gtk-update-icon-cache' 'gconf')
makedepends=('libxml-perl' 'pkgconfig' 'intltool')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.bz2::http://ftp.gnome.org/pub/GNOME/sources/gtetrinet/0.7/${pkgname}-${pkgver}.tar.bz2
        format-security.patch)
sha512sums=('5de7df7647ed9f7c0b6aba4eac976c625b7632eb5ab8034b11ef09aeb4582f90b4f9fc1791dc5371e1067d59c90b792a70276c69b75ebd6dc8c74c96c47c7130'
            '1f3236da7320249c6d8969a73d2d9f50c4dce68525e563958b52c3cfae5bd2c4fa0fda44960acce6bb9326a4b75560c60ab605aadce3b28d770c44c971209406')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 < "${srcdir}/format-security.patch"
  sed -e '/^gamesdir/s:=.*:=@bindir@:' -i src/Makefile.am
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf -vi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package () {
  cd ${pkgname}-${pkgver}
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm "${pkgdir}"/etc/gconf/schemas/*.schemas
}

# vim: ts=2 sw=2 et:
