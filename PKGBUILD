# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Gary Wright <wriggary@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christopher Cox <nuopus@gmail.com>

pkgname=gnomebaker
pkgver=0.6.4
pkgrel=5
pkgdesc="A full featured CD/DVD burning application for Gnome"
license=('GPL')
arch=('i686' 'x86_64')
url="https://gnomebaker.sourceforge.net"
install=gnomebaker.install
depends=('libgnomeui' 'dvd+rw-tools' 'cdrkit' 'cdrdao' 'gstreamer0.10-base-plugins' 'libnotify')
makedepends=('perl-xml-parser' 'rarian' 'patch')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'gnomebaker-0.6.4-libnotify-0.7.patch'
        'gnomebaker-0.6.4-ldadd.patch')
md5sums=('db43492684e0ba349be85e81ce0a9e56'
         '137f6b576d0d49990ac5b9c34bc2fbc9'
         '37a70793b2d708fed1dbc0416b91554e')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  patch -p0 < "${srcdir}"/gnomebaker-0.6.4-libnotify-0.7.patch

  # patch from fedora; thanks to hadrons123 for finding
  patch -p1 < "${srcdir}"/gnomebaker-0.6.4-ldadd.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-libnotify

  make LDFLAGS+="-Wl,--export-dynamic"
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}"/usr/share/gconf/schemas
  gconf-merge-schema \
  "${pkgdir}"/usr/share/gconf/schemas/${pkgname}.schemas \
  "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
