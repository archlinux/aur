# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.16.0
pkgrel=1
pkgdesc='Web-based issue tracking system'
arch=('any')
url='https://www.mantisbt.org/'
license=('GPL')
depends=('php')
optdepends=('apache: Web server to run MantisBT'
            'curl: Twitter integration'
            'gd: Graphs support'
            'lighttpd: Web server to run MantisBT'
            'mariadb: SQL database'
            'nginx: Web server to run MantisBT'
            'php-pgsql: PostgreSQL database'
            'uwsgi: Application server to run MantisBT')
backup=('etc/webapps/mantisbt/config_inc.php'
        'etc/webapps/mantisbt/custom_strings_inc.php'
        'etc/webapps/mantisbt/custom_relationships_inc.php'
        'etc/webapps/mantisbt/custom_functions_inc.php'
        'etc/webapps/mantisbt/custom_constants_inc.php'
)
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('03356253b60e36bb77631321a8079973fbfdcc6ed67d28f16c7cd8ee1d6cb57e72cea3e8cede55aa5c44818584d4ad3a174b6e9ab054657b012178fcb13e79dd')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  find . -type f -exec chmod -c 0644 {} \;
  find . -type d -exec chmod -c 0755 {} \;
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vdm 755 "${pkgdir}"/{etc/webapps,usr/share/webapps}/"${pkgname}"

  # configuration
  install -vDm644 config/config_inc.php.sample \
    "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"

  # readme
  install -vDm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -av --no-preserve='ownership' ../${pkgname}-${pkgver}/* \
    "${pkgdir}/usr/share/webapps/${pkgname}"

  # create customization files
  touch "${pkgdir}/etc/webapps/${pkgname}"/custom_{strings,relationships,functions,constants}_inc.php

  # symlink configuration and configuration
  ln -sv "/etc/webapps/${pkgname}/config_inc.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config/config_inc.php"
  ln -sv "/etc/webapps/${pkgname}/custom_strings_inc.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config/custom_strings_inc.php"
  ln -sv "/etc/webapps/${pkgname}/custom_relationships_inc.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config/custom_relationships_inc.php"
  ln -sv "/etc/webapps/${pkgname}/custom_functions_inc.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config/custom_functions_inc.php"
  ln -sv "/etc/webapps/${pkgname}/custom_constants_inc.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config/custom_constants_inc.php"
}

# vim: ts=2 sw=2 et:
