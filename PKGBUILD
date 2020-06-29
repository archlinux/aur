# Maintainer: Thorsten Mueller <info@thorko.de>
# Contributor:

pkgname=samhain-client
pkgver=4.4.1
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(x86_64 armv7h)
url="http://www.la-samhna.de/"
license=('GPL')
install=samhain.install
source=("http://www.la-samhna.de/samhain/samhain-current.tar.gz"
        "samhain.service")
sha256sums=('a15516f6809b1daf812b39fb5aa6be3fac1a51b5efca53568759fdf54572a2e9'
            '7e53bee6bb9ba15db6e741ed3520491c747e57bb58ffc0da6c5d7e235ac720c9')
validpgpkeys=('EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C')

build() {
  echo "Note: If the GPG verification fails, import the Samhain GPG key: http://www.la-samhna.de/samhain/s_rkey.html"
  gpg --verify samhain-${pkgver}.tar.gz.asc samhain-${pkgver}.tar.gz
  tar -zxvf samhain-${pkgver}.tar.gz
  cd "samhain-${pkgver}"
  # see samhain documentation, lots of other options available. e.g. use --enable-network=server to run in server mode.
  #./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin --enable-network=client --enable-port-check --enable-login-watch --enable-process-check --with-config-file=REQ_FROM_SERVER/etc/samhainrc --with-data-file=REQ_FROM_SERVER/var/lib/samhain/samhain_file --disable-asm
  make
}

package() {
  cd "samhain-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chmod 755 ${pkgdir}/usr/bin/samhain_setpwd
  chmod 755 ${pkgdir}/usr/bin/samhain
  chmod 644 ${pkgdir}/etc/samhainrc
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/samhain.service" "${pkgdir}/usr/lib/systemd/system/samhain.service"
  rmdir ${pkgdir}/run
  rm -rf ${pkgdir}/var/log
}
