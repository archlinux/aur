# Maintainer: Thorsten Mueller <info@thorko.de>
# Contributor: 

pkgname=samhain-client
pkgver=4.3.1
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(x86_64 armv7h)
url="http://www.la-samhna.de/"
license=('GPL')
install=samhain.install
source=("http://www.la-samhna.de/samhain/samhain-current.tar.gz"
        "samhain.service")
sha256sums=('d4dcedc6bc579c935de7972d23675e94654391c3a1bd19c06ec38e57f7faf1f2'
            '7e53bee6bb9ba15db6e741ed3520491c747e57bb58ffc0da6c5d7e235ac720c9')
validpgpkeys=('EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C') 

build() {
  echo "Note: If the GPG verification fails, import the Samhain GPG key: http://www.la-samhna.de/samhain/s_rkey.html"
  gpg --verify samhain-${pkgver}.tar.gz.asc samhain-${pkgver}.tar.gz
  tar -zxvf samhain-${pkgver}.tar.gz
  cd "samhain-${pkgver}"
  # see samhain documentation, lots of other options available. e.g. use --enable-network=server to run in server mode.
  #./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin --enable-network=client --enable-port-check --enable-login-watch --enable-process-check
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
