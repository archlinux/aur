# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: nougad

pkgname=opensmtpd-snapshot
_pkgname=opensmtpd
pkgver=201602131907p1
pkgrel=2
pkgdesc='A FREE implementation of the server-side SMTP protocol. Latest snapshot.'
arch=('i686' 'x86_64')
url="http://www.opensmtpd.org/portable.html"
license=('BSD')
depends=('libevent' 'pam' 'libasr-snapshot')
conflicts=('sendmail' 'postfix' 'opensmtpd')
provides=('opensmtpd')
replaces=('opensmtpd-portable')
options=(emptydirs !strip)
backup=("etc/mail/smtpd.conf" "etc/mail/aliases")
source=("http://www.opensmtpd.org/archives/${_pkgname}-${pkgver}.tar.gz"
        "smtpd.service"
        "smtpd.socket"
        "smtpd.conf.patch")
sha256sums=('0fd10cff59719523e41fe489ff5c1490c2898a2ce47b98e4bf39f07ba3562252'
            '655ca04a3b95e7424d625e60304387c5d73eb35997a7878089cae94e1dae5b27'
            '32d46de5562d01de445d04c93bcc9f94bf103539b676e449c32e3603a3866cf8'
            'da42f59718713c70c24d001604cd123fbde1da4314abbe445347207d0d14f5e4')
install="${pkgname}.install"

prepare() {
  cd "$srcdir"
  patch "${_pkgname}-${pkgver}"/smtpd/smtpd.conf < smtpd.conf.patch
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc/mail \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib/smtpd \
              --with-path-CAfile=/etc/ssl/certs/ca-certificates.crt \
              --with-table-db
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/makemap"
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/newaliases"
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/sendmail"

  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm 644 "$srcdir/smtpd.service" "${pkgdir}/usr/lib/systemd/system/smtpd.service"
  install -Dm 644 "$srcdir/smtpd.socket"  "${pkgdir}/usr/lib/systemd/system/smtpd.socket"

  install -Dm 644 /dev/null "$pkgdir/etc/mail/aliases"

  install -dm 711 "$pkgdir/var/spool/smtpd/"
}
 
