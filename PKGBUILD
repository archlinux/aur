

pkgname=lychee
pkgver=3.1.6
pkgrel=1
pkgdesc="Lychee is an easy to use and great looking photo-management-system."
arch=('any')
url="http://lychee.electerious.com/"
license=('MIT')
depends=('php' 'php-gd' 'mariadb')
optdepends=('php-apache: to use the Apache web server')
makedepends=()
options=('!strip' emptydirs)
backup=('etc/webapps/lychee/apache.example.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/electerious/Lychee/archive/v$pkgver.tar.gz"
	'apache.example.conf')
sha256sums=('721087e3b451300445f3845d39e5921541ea0a8e7ab0462a2ea24942869ab1b1'
            'fe1400a1be9b60c4c8b6759b588638536188a73307cd061789877cd5fd491557')

pkgver() {
    curl -Is https://github.com/electerious/Lychee/releases/latest | awk -F'/' '/^Location/ {print $NF}' | sed 's/v//' |sed 's/[^[:print:]]//'

}


package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/Lychee-$pkgver ${pkgdir}/usr/share/webapps/${pkgname}

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/${pkgname}

  find ${pkgdir}/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/data
  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/uploads
}
