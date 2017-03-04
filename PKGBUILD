# Maintainer: Steven Hiscocks <steven[at]hiscocks[dot]me[dot]uk>
pkgname=milter-greylist
pkgver=4.6.2
pkgrel=1
pkgdesc="milter-greylist is a stand-alone milter written in C that implements the greylist filtering method."
url="http://hcpnet.free.fr/milter-greylist/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('libspf2' 'opendkim')
makedepends=('libmilter')
backup=('etc/mail/greylist.conf')
install="${pkgname}.install"
source=("http://ftp.espci.fr/pub/${pkgname}/${pkgname}-${pkgver}.tgz"
        "milter-greylist-4.5.11-warning.patch"
        "${pkgname}.service")
md5sums=('8872008db2fc6b93dd9ab8576383fec2'
         'SKIP'
         'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < ../milter-greylist-4.5.11-warning.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib --with-libspf2=/usr --with-libopendkim=/usr --enable-dnsrbl --enable-postfix
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m0644 greylist2.conf "${pkgdir}/etc/mail/greylist.conf"

  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
