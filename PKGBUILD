# shellcheck disable=2148,2034,2164,2154
# Maintainer: Matthieu Ippersiel <matthieu.ippersiel@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.27.3
pkgrel=1
pkgdesc="Web-based issue tracking system"
arch=(any)
url="https://www.mantisbt.org/"
license=(GPL2)
depends=(php-legacy)
optdepends=(
  'curl: interface Twitter'
  'mariadb: use local MySQL server'
  'php-legacy-fpm: run in fastCGI process manager'
  'php-legacy-gd: generate captcha'
  'php-legacy-pgsql: use PostgreSQL database backend'
  'postgresql: use local PostgreSQL database'
  'uwsgi-plugin-php: run as application container'
)
backup=(
  "etc/webapps/${pkgname}/config_inc.php"
  "etc/webapps/${pkgname}/custom_strings_inc.php"
  "etc/webapps/${pkgname}/custom_relationships_inc.php"
  "etc/webapps/${pkgname}/custom_functions_inc.php"
  "etc/webapps/${pkgname}/custom_constants_inc.php"
  "etc/uwsgi/${pkgname}.ini"
)
# building from source requires dead tooling for documentation:
# https://mantisbt.org/bugs/view.php?id=27140
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/release-${pkgver}.tar.gz"
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
  "${pkgname}.uwsgi"
)
sha512sums=('2b8fd4f20f390fd855ddf818cfbd95c1fdffb236860ba69593f12af68b925f376df6626748c6dba1d575a48a8019e4ad50421f1f858a1443be7e85b01e4f1470'
  '3fd4e7faad7774892abfd20006ae3efcd7b0ba315447da9cea8d7352d5fd1e7f0c558d3855ad4e667a0bfe6ae0d95d12c848a78d53312521a7f551f2edca723e'
  '6f6c6ca7cafeb3f76ba0aa62af1a7adb39b87d7db201b30a52d57507b1333cdffd60ae787b15c97919380a7a133daef73bd22fde5cccda2d5b98f54b32049c5b'
  'c6033ab6bfe6c89c2918dde66b3ec912dc50d4c6ad34c413076e16ccb9c7374f5d65a637c2c8e935eabfbe354ff3f316cd1969bcc7b50dfec45628d8918aa07a')
install="${pkgname}.install"

prepare() {
  # Create customization files
  touch custom_{constants,functions,relationships,strings}_inc.php

  # Remove useless scripts
  find "${pkgname}-${pkgver}/vendor" -type f -iname "*.py" -delete
}

package() {
  cd "${pkgname}-${pkgver}"
  # Configuration and add suggestion disk location as per package structure
  install -Dm 640 config/config_inc.php.sample "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  rm config/config_inc.php.sample
  sed -i "/^# \\\$g_absolute_path_default_upload_folder/s|''|'/var/lib/${pkgname}/'|" "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  install -Dm 644 ../*.php -t "${pkgdir}/etc/webapps/${pkgname}/"

  # Doc
  install -Dm 644 ./*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rm ./*.md

  # Web application
  find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/webapps/${pkgname}/"{} \;

  # Symlink configuration and customization
  for config in {config,custom_{constants,functions,relationships,strings}}_inc.php; do
    ln -s "/etc/webapps/${pkgname}/${config}" "${pkgdir}/usr/share/webapps/${pkgname}/config/${config}"
  done

  # tmpfiles.d
  install -Dm 644 ../${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # sysusers.d
  install -Dm 644 ../${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # uWSGI
  install -Dm 644 ../${pkgname}.uwsgi "${pkgdir}/etc/uwsgi/${pkgname}.ini"
}
