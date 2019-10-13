# Maintainer: Victor3D <webmaster@victor3d.com.br>
pkgname=fetchmail
pkgver=6.4.1
_majver=6.4
pkgrel=1
pkgdesc="A remote-mail retrieval utility"
arch=('x86_64')
url="http://www.fetchmail.info"
license=('GPL')
depends=('openssl')
makedepends=('python2')
optdepends=('tk: for using fetchmailconf'
            'python2: for using fetchmailconf')
options=('!makeflags')
source=("https://sourceforge.net/projects/fetchmail/files/branch_${_majver}/${pkgname}-${pkgver}.tar.xz"
         'fetchmail.tmpfiles' 'fetchmail.sysusers' 'fetchmail.service')
sha1sums=('1aadf078ed8fb1b6c93e9126cc0375b1f740301a'
          '199ba749c829f22286c34aabcf8b7dd5bbd7c0e6'
          'b113cb61a866eff53cd8f113d084a99f01bf5d77'
          '0fc1870a33d1e0efb70169ddf1b6adc9d253e076')

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
  cd -
  install -D -m644 fetchmail.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/fetchmail.conf
  install -D -m644 fetchmail.sysusers "$pkgdir"/usr/lib/sysusers.d/fetchmail.conf
  install -D -m644 fetchmail.service "$pkgdir"/usr/lib/systemd/system/fetchmail.service
}
