
# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
#
pkgname=osticket
pkgver=1.10.4
pkgrel=2
pkgdesc='A widely-used open source support ticket system.'
arch=('any')
url='http://www.osticket.com/'
license=('GPL')
depends=('php' 'php-apache' 'mariadb')
makedepends=('unzip')
install="${pkgname}.install"
source=("https://github.com/osTicket/osTicket/releases/download/v$pkgver/osTicket-v$pkgver.zip"
	"error_Valid_CSRF_Token_Required.patch")
sha256sums=('dbfdc0159471b68a3f54898a18504b999bfeb03920551e2fb827a74cc69cd928'
            '8398d7e5ca92508dc06291b44dc75ffb9f09d9850bfc6a13ec9eecfcc434d4c7')

package() {
  cd $srcdir

  # make destination directory
  install -d ${pkgdir}/usr/share/webapps/${pkgname} 

  # unzip into right folder
  sleep 1
  echo "Extracting files"
  sleep 1
  unzip -d ${pkgdir}/usr/share/webapps/${pkgname} "osTicket-v$pkgver"

  # fix issue https://github.com/osTicket/osTicket/issues/4262#issuecomment-386066797 with patch
  cd ${pkgdir}/usr/share/webapps/${pkgname}/upload
  patch -Np1 -i "${srcdir}/error_Valid_CSRF_Token_Required.patch"

  # fix permissions (probably needs to get included upstream)
  find ${pkgdir}/usr/share/webapps/$pkgname -type f -exec chmod 0664 {} \; 
  find ${pkgdir}/usr/share/webapps/$pkgname -type d -exec chmod 0775 {} \;
}
