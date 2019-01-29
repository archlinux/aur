# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.19.0
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
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'tmpfiles.conf')
sha512sums=('5d074bc3605a9aae3c4b738e0ea667c3687e97a04e2702941158301ab9c86c14e8bc83fe8d5b9d34d5d011f5b5041d37b1bd44ea40815c2d1ae91f6130b5a987'
            'e0c3fc92a3a61f86f780e5e30ccefe751ef0f16727a44006f8c7dae53951abaa0b8c6e0dc3e807668e0fe78252296996a6123cc5d5bf8427055ae07efe3bd37e')
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
  install -vDm 644 config/config_inc.php.sample \
    "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  # create customization files
  touch "${pkgdir}/etc/webapps/${pkgname}"/custom_{strings,relationships,functions,constants}_inc.php

  # readme
  install -vDm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  cp -av --no-preserve='ownership' ../${pkgname}-${pkgver}/* \
    "${pkgdir}/usr/share/webapps/${pkgname}"

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

  # tmpfiles.d integration
  install -vDm 644 ../tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim: ts=2 sw=2 et:
