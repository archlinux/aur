# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=opensmtpd-git
_pkgname=opensmtpd
_gitname=OpenSMTPD
pkgver=latest
pkgrel=1
pkgdesc='A FREE implementation of the server-side SMTP protocol. Latest snapshot.'
arch=('i686' 'x86_64')
url="http://www.opensmtpd.org/"
license=('BSD')
depends=('libevent' 'pam' 'libasr-git')
conflicts=('sendmail' 'postfix' 'opensmtpd')
provides=('opensmtpd')
options=(emptydirs !strip)
backup=("etc/mail/smtpd.conf" "etc/mail/aliases")
source=("git+https://git@github.com/OpenSMTPD/OpenSMTPD.git#branch=portable"
        "smtpd.service"
        "smtpd.socket"
        "smtpd.conf.patch")
sha256sums=('SKIP'
            '655ca04a3b95e7424d625e60304387c5d73eb35997a7878089cae94e1dae5b27'
            '32d46de5562d01de445d04c93bcc9f94bf103539b676e449c32e3603a3866cf8'
            'da42f59718713c70c24d001604cd123fbde1da4314abbe445347207d0d14f5e4')
install="${pkgname}.install"

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/${_gitname}"
  ./bootstrap
}

build() {
  cd "$srcdir/${_gitname}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc/mail \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib/smtpd \
              --with-sock-dir=/run \
              --with-privsep-path=/var/empty \
              --with-privsep-user=_smtpd \
              --with-queue-user=_smtpq \
              --with-filter-user=_smtpf \
              --with-pam \
              --with-ca-file=/etc/ssl/certs/ca-certificates.crt
  make
  patch smtpd/smtpd.conf < ../smtpd.conf.patch
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="${pkgdir}/" install

  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm 644 "$srcdir/smtpd.service" "${pkgdir}/usr/lib/systemd/system/smtpd.service"
  install -Dm 644 "$srcdir/smtpd.socket"  "${pkgdir}/usr/lib/systemd/system/smtpd.socket"

  install -Dm 644 /dev/null "$pkgdir/etc/mail/aliases"

  install -dm 711 "$pkgdir/var/spool/smtpd/"
}
 
