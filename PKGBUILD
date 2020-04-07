# Maintainer: Amish <contact at via dot aur>
# Contributor: Victor3D <webmaster@victor3d.com.br>
pkgname=fetchmail
pkgver=6.4.3
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
sha1sums=('14dbbad6714d3498920ed4058479a3ddf34fe96c'
          '227f1c6a4ea15d73d22d5db9330566e174c45cf9'
          '4d1f04cfa50b708736784cd6d3f4e8c1c624c680'
          '0d06feaaef5e837758da3100332f8fb15f02b5b1')

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
