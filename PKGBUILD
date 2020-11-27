# Maintainer: Amish <contact at via dot aur>
# Contributor: Victor3D <webmaster@victor3d.com.br>
pkgname=fetchmail
pkgver=6.4.14
pkgrel=1
pkgdesc="A remote-mail retrieval utility"
arch=('x86_64')
url="http://www.fetchmail.info"
license=('GPL')
depends=('openssl')
makedepends=('python')
optdepends=('tk: for using fetchmailconf'
            'python-future: for using fetchmailconf')
options=('!makeflags')
source=("https://sourceforge.net/projects/fetchmail/files/branch_${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        'fetchmail.tmpfiles' 'fetchmail.sysusers' 'fetchmail.service')
sha256sums=('424707390f7cdc6d16db4887931117f2242873846b28cc1d0ae1c0ecf158bdcb'
            'dcf0eb2f86fb00faf447b22edbf8e93f3045130c45395357a0ffb8243fd95f96'
            '262903b345c67a1e772ba8623300de88ae1d263e9573d5b7e5ee6e3b2c96772e'
            '0b5a70eac28e4a5aab36ca7e1d0e31139833b977ce689f683b5c666fa36475c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-ssl=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"
  install -D -m644 fetchmail.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/fetchmail.conf
  install -D -m644 fetchmail.sysusers "${pkgdir}"/usr/lib/sysusers.d/fetchmail.conf
  install -D -m644 fetchmail.service "${pkgdir}"/usr/lib/systemd/system/fetchmail.service
}
