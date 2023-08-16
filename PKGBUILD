# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: mortzu

pkgname='inetutils-syslogd'
_pkgname='inetutils'
pkgver='2.4'
pkgrel='1'
pkgdesc='A small syslogd'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/inetutils/'
license=('GPL3')
groups=('base')
depends=('readline' 'ncurses' 'pam')
options=('!emptydirs')
provides=('logger')
backup=('etc/syslog.conf')
_srcdir="${_pkgname}-${pkgver}"
source=(
  "https://ftp.gnu.org/gnu/inetutils/${_pkgname}-${pkgver}.tar.gz"
  'syslog.conf'
  'inetutils-syslogd.service'
)
md5sums=('04f8ca625d4f08ee824e98fee65b35eb'
         '71d7027920dd7641653705de65fd0d97'
         'f528a4b680e878a13f745a38f9499e06')
sha256sums=('76aee0c2f0954728600d510955d697a4ec29324318e784848db606ee3c09e365'
            'a0fdd3eef46ac1a671c6a5743cd8a57213ea179c844f091eae37647f8246edde'
            '84086b9b3ce93db7af58d8a47cbd30e664dec83640e62b5145140b87554c82ba')

build() {
  cd "${_srcdir}"
  sed -e '/gets is a security/d' -i 'lib/stdio.in.h'

  local _conf=(
    --prefix='/usr'
    --libexec='/usr/bin'
    --localstatedir='/var'
    --sysconfdir='/etc'
    --mandir='/usr/share/man'
    --infodir='/usr/share/info'
    --without-wrap
    --with-pam
    --disable-dnsdomainname
    --disable-ftp
    --disable-ftpd
    --disable-telnet
    --disable-telnetd
    --disable-talk
    --disable-talkd
    --disable-rlogin
    --disable-rlogind
    --disable-rsh
    --disable-rshd
    --disable-rexec
    --disable-rexecd
    --disable-rcp
    --disable-hostname
    --disable-tftp
    --disable-tftpd
    --disable-ping
    --disable-ping6
    --disable-logger
    --enable-syslogd
    --disable-inetd
    --disable-whois
    --disable-uucpd
    --disable-ifconfig
    --disable-traceroute
  )
  ./configure "${_conf[@]}"
  make
}

check() {
  cd "${_srcdir}"
  make check
}

package() {
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install

  rm -Rf "${pkgdir}/usr/share/info"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/syslog.conf" "${pkgdir}/etc/syslog.conf"
}
