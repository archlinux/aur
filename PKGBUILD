# Maintainer: Amish <contact at via dot aur>
# Contributor: Steven Hiscocks <steven[at]hiscocks[dot]me[dot]uk>
pkgname=milter-greylist
pkgver=4.6.4
pkgrel=2
pkgdesc="A stand-alone milter written in C that implements the greylist filtering method."
url="http://hcpnet.free.fr/milter-greylist/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('libspf2' 'opendkim')
makedepends=('libmilter')
backup=('etc/mail/greylist.conf')
source=("http://ftp.espci.fr/pub/${pkgname}/${pkgname}-${pkgver}.tgz"
        'milter-greylist-4.5.11-warning.patch'
        "${pkgname}.service")
md5sums=('def021c0ff43e4c3f1ae2f8bb997ceac'
         '0901deb488277f8fed50158cffb726a2'
         '51665e97390bf7df11bb509bfb57544b')

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
  sed -i -e 's,#dumpfile .*,dumpfile "/var/lib/milter-greylist/greylist.db",g' \
    -e 's,#socket .*,socket "/var/lib/milter-greylist/greylist.sock",g' \
    -e 's,#user .*,user "milt-gl:milt-gl",g' \
    "${pkgdir}/etc/mail/greylist.conf"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  echo "u milt-gl - - /var/lib/milter-greylist" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  echo "d /var/lib/milter-greylist 0750 milt-gl milt-gl" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  sed -ne '/This software is available under/,$ p' README | install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rmdir "${pkgdir}"/var{/lib{/milter-greylist,},}
}

# vim:set ts=2 sw=2 et:
