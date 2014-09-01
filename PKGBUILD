# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=provision
pkgver=2.1
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url="http://drupal.org/project/provision"
license=('GPL')
depends=(
	'apache'
    'drush'
    'mariadb-clients'
    'php'
    'php-apache'
    'sudo'
    'smtp-forwarder'
)
optdepends=(
	'rsync: asdf'
	'mariadb: '
	'nginx: '
	'php-fpm: '
)
install="${pkgname}.install"
options=(!strip docs)
source=(
	"http://ftp.drupal.org/files/projects/${_pkgname}-6.x-${pkgver}.tar.gz"
	'sudoers'
	"${pkgname}.install"
)
md5sums=(
	'83d3022e6cbf36ecdc7733dec308d427'
	'60acd383d30db2c1f2eb95ad0e0c770a'
	'44eec832ed46bbdb93385f42f03039ed'
)

package() {
    cd $_pkgname
    
    msg2 'Purging unwanted files'
    rm -r debian
    rm LICENSE.txt
    rm upgrade.sh.txt
    rm release.sh
    
    msg2 'Adding doc files'
	install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
	mv -t "${pkgdir}/usr/share/doc/${pkgname}/examples" example example.sudoers
	mv -t "${pkgdir}/usr/share/doc/${pkgname}" HACKING_2x.mdwn *.txt
	find "${pkgdir}/usr/share/doc/${pkgname}" -type f -exec chmod 0644 {} +
	find "${pkgdir}/usr/share/doc/${pkgname}" -type d -exec chmod 0755 {} +
    
    msg2 'Adding extension files'
	install -m755 -d "${pkgdir}/usr/share/drush/commands/${_pkgname}"
    mv * "${pkgdir}/usr/share/drush/commands/${_pkgname}"
	find "${pkgdir}/usr/share/drush/commands/${_pkgname}" -type f -exec chmod 0644 {} +
	find "${pkgdir}/usr/share/drush/commands/${_pkgname}" -type d -exec chmod 0755 {} +
	
	msg2 'Adding aegir sudoers rules'
	install -m755 -D ../sudoers "${pkgdir}/etc/sudoers.d/aegir"
}
