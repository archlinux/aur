# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sébastien Luttringer
# Contributor: parchd <parchd@archlinux.info>

pkgname=opensmtpd-libressl
pkgver=6.4.2p1
pkgrel=4
pkgdesc='OpenSMTPD built against LibreSSL'
arch=('i686' 'x86_64')
url="http://www.opensmtpd.org/"
license=('BSD')
depends=('libressl' 'libevent' 'pam' 'libasr')
provides=('smtp-server' 'smtp-forwarder' 'opensmtpd')
conflicts=('smtp-server' 'smtp-forwarder' 'opensmtpd')
backup=("etc/smtpd/smtpd.conf" "etc/smtpd/aliases")
options=(emptydirs)
source=(
  "https://www.opensmtpd.org/archives/opensmtpd-$pkgver.tar.gz"
  'opensmtpd.sysusers'
  'opensmtpd.tmpfiles'
  'smtpd.service'
  'smtpd.socket'
)
sha256sums=('6d71155b15fa4ef0198d10dfb7b1905845c9d36d4a02321245a99da80002fb5d'
            'b38b64f1457b7227d55585edc711cce525e089516d16b093e6c44387380e6b13'
            '107bc2a46fa885e355e551cc362dce5ef2362a8f4ad4cb12d6310a7b6d4edb54'
            '5c0f60d7bcebb1a6d371e7254b20d8ed2cfd79db64b3c3e9a6e992955bd6678f'
            '32d46de5562d01de445d04c93bcc9f94bf103539b676e449c32e3603a3866cf8')

prepare() {
  cd "opensmtpd-$pkgver"

  sed -i \
    -e 's#/etc/mail#/etc/smtpd#g' \
    -e 's/^listen on localhost$/listen on lo/' \
    smtpd/smtpd.conf

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/smtpd \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/smtpd \
    --with-user-smtpd=smtpd \
    --with-user-queue=smtpq \
    --with-group-queue=smtpq \
    --with-path-CAfile=/etc/ssl/certs/ca-certificates.crt \
    --with-cflags='-I/usr/include/libressl -L/usr/lib/libressl -Wl,-rpath=/usr/lib/libressl'
}

build() {
  cd "opensmtpd-$pkgver"
  make
}

package() {
  cd "opensmtpd-$pkgver"

  make DESTDIR="$pkgdir/" install

  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/sendmail"
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/mailq"
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/newaliases"
  ln -s /usr/bin/smtpctl "$pkgdir/usr/bin/makemap"

  # install additional files
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/opensmtpd.sysusers" "$pkgdir/usr/lib/sysusers.d/opensmtpd.conf"
  install -Dm644 "$srcdir/opensmtpd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/opensmtpd.conf"
  install -Dm644 "$srcdir/smtpd.service" "$pkgdir/usr/lib/systemd/system/smtpd.service"
  install -Dm644 "$srcdir/smtpd.socket" "$pkgdir/usr/lib/systemd/system/smtpd.socket"

  # install an empty aliases file (used by the default config)
  install -Dm644 /dev/null "$pkgdir/etc/smtpd/aliases"
}
