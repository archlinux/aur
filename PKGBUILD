
pkgname=fetchmail
pkgver=6.3.26
pkgrel=7
pkgdesc="A remote-mail retrieval utility"
arch=('x86_64')
url="http://www.fetchmail.info"
license=('GPL')
depends=('openssl')
makedepends=('python2')
optdepends=('tk: for using fetchmailconf'
            'python2: for using fetchmailconf')
options=('!makeflags')
source=("https://sourceforge.net/projects/fetchmail/files/branch_6.3/${pkgname}-${pkgver}.tar.xz"{,.asc}
        'disable-sslv3.patch' 'fetchmail.tmpfiles' 'fetchmail.sysusers' 'fetchmail.service')
sha1sums=('de8dbe62a8edfa232ee4278257a1fe67aa1c797a'
          'SKIP'
          'dab3bf46b033e8ee7cadc020c1fb4ce325f46693'
          '199ba749c829f22286c34aabcf8b7dd5bbd7c0e6'
          'b113cb61a866eff53cd8f113d084a99f01bf5d77'
          '0fc1870a33d1e0efb70169ddf1b6adc9d253e076')
validpgpkeys=('FDD00C436E3307E10758C6A8BE618339052E7D95')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../disable-sslv3.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' fetchmailconf.py
  PYTHON=python2 ./configure --prefix=/usr --with-ssl=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d -o 90 -g nobody "${pkgdir}/var/lib/fetchmail"
  install -D -m644 ${srcdir}/fetchmail.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/fetchmail.conf
  install -D -m644 ${srcdir}/fetchmail.sysusers ${pkgdir}/usr/lib/sysusers.d/fetchmail.conf
  install -D -m644 ${srcdir}/fetchmail.service ${pkgdir}/usr/lib/systemd/system/fetchmail.service
}
