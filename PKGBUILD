# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=samhain
pkgver=4.3.2
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(x86_64)
url="http://www.la-samhna.de/"
license=('GPL')
install=samhain.install
source=("http://www.la-samhna.de/samhain/${pkgname}-current.tar.gz"
        "samhain.service")
sha256sums=('0582864ef56ab796031e8e611ed66c48adeb3a30ec34e1a8d0088572442035fc'
            '7e53bee6bb9ba15db6e741ed3520491c747e57bb58ffc0da6c5d7e235ac720c9')
validpgpkeys=('EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C') # Rainer Wichmann

build() {
  echo "Note: If the GPG verification fails, import the Samhain GPG key: http://www.la-samhna.de/samhain/s_rkey.html"
  gpg --verify samhain-${pkgver}.tar.gz.asc samhain-${pkgver}.tar.gz
  tar -zxvf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  # see samhain documentation, lots of other options available. e.g. use --enable-network=server to run in server mode.
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chmod 755 ${pkgdir}/usr/bin/samhain
  chmod 644 ${pkgdir}/etc/samhainrc
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/samhain.service" "${pkgdir}/usr/lib/systemd/system/samhain.service"
  rmdir ${pkgdir}/run
  rmdir ${pkgdir}/var/log
}
