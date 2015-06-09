# Maintainer: megadriver <megadriver at gmx dot com>
# Based on lynx from [extra]

pkgname=lynx-current
_basever=2.8.9
pkgver=${_basever}dev.6
pkgrel=1
pkgdesc="A text browser for the World Wide Web (development version)"
url="http://lynx.isc.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'openssl')
conflicts=('lynx')
provides=('lynx')
backup=('etc/lynx.cfg')
source=("http://lynx.isc.org/current/lynx${pkgver}.tar.gz")
md5sums=('52bcab0224ae22b8d425413a143f5e23')

build() {
  cd ${srcdir}/lynx${_basever//./-}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ssl=/usr \
    --enable-nls \
    --enable-ipv6 \
    --enable-default-colors \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/lynx${_basever//./-}
  make DESTDIR=${pkgdir} install

  # FS#20404 - points to local help
  sed -i -e "s|^HELPFILE.*$|HELPFILE:file:///usr/share/doc/lynx/lynx_help/lynx_help_main.html|" ${pkgdir}/etc/lynx.cfg

  install -d ${pkgdir}/usr/share/doc/lynx
  cp -rf lynx_help ${pkgdir}/usr/share/doc/lynx
}
