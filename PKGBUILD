pkgname=inetutils-syslogd
_pkgname=inetutils
pkgver=1.9.2
pkgrel=1
pkgdesc="A small syslogd"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/inetutils/"
license=('GPL3')
groups=('base')
depends=('readline' 'ncurses' 'pam')
options=('!emptydirs')
provides=('logger')
backup=(etc/syslog.conf)
source=(http://ftp.gnu.org/gnu/inetutils/${_pkgname}-${pkgver}.tar.gz
        syslog.conf
        inetutils-syslogd.service)
md5sums=('aa1a9a132259db83e66c1f3265065ba2'
         '71d7027920dd7641653705de65fd0d97'
         'f528a4b680e878a13f745a38f9499e06')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  sed -i -e '/gets is a security/d' lib/stdio.in.h

  ./configure --prefix=/usr --libexec=/usr/bin --localstatedir=/var \
    --sysconfdir=/etc --mandir=/usr/share/man --infodir=/usr/share/info \
    --without-wrap --with-pam \
    --disable-dnsdomainname \
    --disable-ftp --disable-ftpd \
    --disable-telnet --disable-telnetd \
    --disable-talk --disable-talkd \
    --disable-rlogin --disable-rlogind \
    --disable-rsh --disable-rshd \
    --disable-rexec --disable-rexecd \
    --disable-rcp --disable-hostname \
    --disable-tftp --disable-tftpd \
    --disable-ping --disable-ping6 \
    --disable-logger --enable-syslogd \
    --disable-inetd --disable-whois \
    --disable-uucpd --disable-ifconfig --disable-traceroute
  make
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -Rf "${pkgdir}/usr/share/info"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/syslog.conf" "${pkgdir}/etc/syslog.conf"
}
