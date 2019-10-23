# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=opensmtpd-git
_pkgname=OpenSMTPD
pkgver=6.6.0+r2318+g8e53e1bd
pkgrel=1
pkgdesc='Security-focused, simple, and performant SMTP server written in C (Git)'
arch=(x86_64)
url=https://www.opensmtpd.org
license=(custom)
depends=(libasr zlib)
makedepends=(git)
provides=(smtp-server smtp-forwarder)
conflicts=(smtp-server smtp-forwarder)
backup=(etc/smtpd/smtpd.conf etc/smtpd/aliases)
source=(
  git+https://github.com/OpenSMTPD/OpenSMTPD#branch=portable
  opensmtpd.sysusers
  opensmtpd.tmpfiles
  smtpd.service
  smtpd.socket
)
sha512sums=('SKIP'
            '95df5a97ef20cbdfb5bb702d0d83397b0f8e205bd85cdce57227a9691d289f14a2fa4bbd85b527e3934d2b1216011e2214cf79589afce6fbb73c8b00d74097b3'
            '318e0e9cf860995fd0c81baa8226c75cc7bf3a221ca5ceb46118ce06903ff30bb337b00fa78afb6e18cf1502362233a3dce04b0e98b2af0937ca97ed68b43f1a'
            'b3317315d4f378d7b8e10eac0313abac179be3351e1e0c476386384f788065f53f881224810bcf91662906ec0242ca7ffb6a91e6cbc56dddf1483100bca8b819'
            '806025d000ba34e86338bf127951e853849e077fe6941f7d0f43c362303ed191554f1d983d422f1acec22e89091517237a60da6e7ae6db1cb977fffe666e48c4')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

prepare() {
  sed 's#etc/mail#etc/smtpd#;s#localhost#lo#' -i $_pkgname/smtpd/smtpd.conf
}

build() {
  cd $_pkgname

  ./bootstrap

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/smtpd \
    --sysconfdir=/etc/smtpd \
    --with-user-smtpd=smtpd \
    --with-user-queue=smtpq \
    --with-group-queue=smtpq \
    --with-path-CAfile=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm 644 etc/aliases -t "$pkgdir"/etc/smtpd

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  for link in sendmail send-mail mailq makemap newaliases; do
    ln -s smtpctl "$pkgdir"/usr/bin/$link
  done

  cd ..

  install -Dm 644 opensmtpd.sysusers "$pkgdir"/usr/lib/sysusers.d/opensmtpd.conf
  install -Dm 644 opensmtpd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/opensmtpd.conf
  install -Dm 644 smtpd.{service,socket} -t "$pkgdir"/usr/lib/systemd/system
}
